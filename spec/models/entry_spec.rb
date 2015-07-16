require "rails_helper"

describe Entry do
  describe "validations" do
    subject { create(:entry) }
    it { should validate_presence_of :headline }
    it { should validate_presence_of :url }
    it { should validate_presence_of :summary }
    it { should validate_presence_of :feed_id }
    it { should validate_uniqueness_of(:url).scoped_to(:feed_id) }
  end

  describe "associations" do
    it { should belong_to :feed }
  end

  describe ".exists?" do
    it "is true when an entry for the given feed with given url exists" do
      feed = create(:feed)
      url = "http://example.com"
      create(:entry, feed: feed, url: url)

      expect(Entry.exists?(feed: feed, url: url)).to be(true)
    end

    it "is false when no entry for given feed with given url exists" do
      feed = create(:feed)
      url = "http://example.com"

      expect(Entry.exists?(feed: feed, url: url)).to be(false)
    end
  end
end
