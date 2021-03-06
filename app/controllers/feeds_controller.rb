class FeedsController < ApplicationController
  after_filter :discard_flash, only: :create

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

    respond_to do |format|
      if @feed.save
        format.html do
          flash[:success] = t(".success")
          redirect_to @feed
        end

        format.js do
          flash.now[:success] = t(".success")
        end
      else
        format.html do
          flash.now[:error] = t(".failure")
          render :new
        end

        format.js do
          flash.now[:error] = t(".failure")
          render :new
        end
      end
    end
  end

  def edit
    @feed = current_feed
  end

  def update
    @feed = current_feed

    if @feed.update(feed_params)
      flash[:success] = t(".success")
      redirect_to @feed
    else
      flash.now[:error] = t(".failure")
      render :edit
    end
  end

  def destroy
    if current_feed.destroy
      flash[:success] = t(".success")
    else
      flash[:error] = t(".failure")
    end

    redirect_to feeds_path
  end

  private

  def current_feed
    current_user.feeds.find(params[:id])
  end

  def feed_params
    params.require(:feed).permit(
      :name,
      :publication_id,
      :url,
    ).merge(user: current_user)
  end
end
