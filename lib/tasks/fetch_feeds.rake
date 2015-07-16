namespace :feeds do
  desc "Fetch feeds and update entries"
  task fetch: :environment do
    fetcher = FeedFetcher.new
    fetcher.delay.fetch_all
  end
end
