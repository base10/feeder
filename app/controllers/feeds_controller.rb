class FeedsController < ApplicationController
  skip_before_action :require_login, only: [:index]

  def index
    if signed_in?
      @feeds = current_user.feeds
    end
  end

  def show
    @feed = current_feed
  end

  def new
    @feed = Feed.new
  end

  def create
    @feed = Feed.new(feed_params)

    if @feed.save
      flash[:success] = t(".success")
      redirect_to @feed
    else
      flash.now[:error] = t(".failure")
      render :new
    end
  end

  private

  def current_feed
    current_user.feeds.find(params[:id])
  end

  def feed_params
    params.require(:feed).permit(:name, :url).merge(user: current_user)
  end
end
