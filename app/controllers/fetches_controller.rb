class FetchesController < ApplicationController
  after_filter :discard_flash, only: :create

  def create
    feed = current_feed
    feed.delay.fetch

    flash.now[:notice] = t("feeds.index.fetch", feed_name: feed.name)

    respond_to do |format|
      format.js {}
    end
  end

  private

  def current_feed
    current_user.feeds.find(params[:feed_id])
  end
end
