module Feeder; end

class Feeder::Feed
  require "dotenv"
  require "erb"
  require "faraday"
  require "faraday_middleware"
  require "feedjira"

  FEEDER_LOGFILE = File.expand_path("../../../log/feeder.log", __FILE__)
  RETRY_LIMIT = 3

  attr_accessor :entries, :parsed_feed, :url

  def initialize(url:)
    @entries = Array.new
    @url = url

    Dotenv.load
  end

  def fetch
    @parsed_feed = parse_feed(request_feed)
    @entries = parsed_feed.entries
  end

  def report_file
    path = ENV.fetch("REPORT_PATH")
    date = Date.today.strftime("%Y-%m-%d")

    "#{path}/#{date}-feed-entries.md"
  end

  def report
    erb = ERB.new(File.read(template_file))
    report_body = erb.result(binding)
    File.open(report_file, "w") { |file| file.write(report_body) }
  end

  private

  def request_feed
    connection = Faraday.new(url: url) do |faraday|
      faraday.use Faraday::Adapter::NetHttp
      faraday.use Faraday::Response::Logger, Logger.new(FEEDER_LOGFILE)
      faraday.use FaradayMiddleware::FollowRedirects, limit: RETRY_LIMIT
    end

    response = connection.get
    response.body
  end

  def parse_feed(raw_feed)
    ::Feedjira::Feed.parse(raw_feed)
  end

  def template_file
    File.expand_path("../../../templates/feed.md.erb", __FILE__)
  end
end
