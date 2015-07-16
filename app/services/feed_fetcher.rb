class FeedFetcher
  def fetch_all
    feeds.each(&:fetch)
  end

  private

  def feeds
    @feeds ||= ::Feed.all
  end
end
