require "rails_helper"

describe Feed do
  describe "validations" do
    subject { create(:feed) }

    it { should validate_presence_of :name }
    it { should validate_presence_of :url }
    it { should validate_uniqueness_of(:url).scoped_to(:user_id) }
    it { should validate_presence_of :user_id }
    it { should belong_to :user }
    it { should have_many :entries }
  end

  describe "#fetch" do
    it "retrieves feed contents" do
      feed = build(:feed)
      stub_feed_request(feed: feed)

      feed.fetch

      expect(WebMock).to have_requested(:get, feed.url)
    end

    it "adds an entry when a feed has new content" do
      feed = create(:feed)
      stub_feed_request(feed: feed)
      prefetch_entry_count = feed.entries.size

      feed.fetch

      expect(prefetch_entry_count).to eq(0)
      expect(feed.entries.size).to be > 0
      expect(feed).to be_persisted
    end

    it "ignores entries that match a URL to an existing entry for a user" do
      feed = create(:feed)
      stub_feed_request(feed: feed)
      feed.fetch
      prefetch_entry_count = feed.entries.size

      feed.fetch

      expect(feed.entries.size).to eq(prefetch_entry_count)
    end

    it "adds entries for each user when two users have a 'duplicate' feed" do
      feed = create(:feed)
      new_user = create(:user)
      new_user_feed = feed.dup
      new_user_feed.user = new_user
      new_user_feed.save
      stub_feed_request(feed: feed)
      stub_feed_request(feed: new_user_feed)

      feed.fetch
      new_user_feed.fetch

      expect(feed.entries.map(&:url)).to match_array(
        new_user_feed.entries.map(&:url)
      )
    end
  end

  def stub_feed_request(feed:)
    stub_request(:get, feed.url).to_return(
      body: feed_fixture,
      status: 200,
    )
  end

  def feed_fixture
    File.read(fixture_path)
  end

  def fixture_path
    "#{Rails.root}/spec/support/fixtures/feed.rss"
  end
end
