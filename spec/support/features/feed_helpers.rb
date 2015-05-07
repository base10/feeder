module Features
  def have_feed(feed)
    have_data_role(role: "feed-name", text: feed)
  end
end
