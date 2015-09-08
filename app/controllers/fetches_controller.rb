class FetchesController < ApplicationController
  def create
    feed = current_feed
    feed.delay.fetch

    flash.now[:notice] = t("feeds.index.fetch", feed_name: feed.name)
    render partial: "flashes", layout: false
  end

  private

  def current_feed
    current_user.feeds.find(params[:feed_id])
  end
end
