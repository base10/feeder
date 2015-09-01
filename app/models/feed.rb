class Feed < ActiveRecord::Base
  require "faraday"
  require "faraday_middleware"
  require "feedjira"

  RETRY_LIMIT = 3

  belongs_to :user
  has_many :entries

  validates :name, presence: true
  validates :url, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true

  def fetch
    parse_feed(request_feed)
    build_entries
  end

  private

  def build_entries
    parsed_feed.entries.each do |rss_entry|
      exists = Entry.exists?(feed: self, url: rss_entry.url)

      if !exists
        entry = Entry.new(
          headline: rss_entry.title,
          published_at: rss_entry.published,
          summary: rss_entry.summary,
          url: rss_entry.url,
        )

        entries << entry
      end
    end
  end

  def connection
    Faraday.new(url: url) do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.response :logger
      faraday.use FaradayMiddleware::FollowRedirects, limit: RETRY_LIMIT
    end
  end

  def parse_feed(raw_feed)
    @parsed_feed = ::Feedjira::Feed.parse(raw_feed)
  end

  def request_feed
    response = connection.get
    response.body
  end

  attr_reader :parsed_feed
end
