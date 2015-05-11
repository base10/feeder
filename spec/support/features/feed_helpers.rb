module Features
  def have_feed(feed)
    have_data_role(role: "feed-name", text: feed)
  end

  def have_feed_entry(headline)
    have_data_role(role: "headline", text: headline)
  end
end
