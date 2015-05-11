class EntriesController < ApplicationController
  helper_method :current_feed

  def edit
    @entry = current_entry
  end

  def update
    entry = current_entry

    if entry.update(entry_params)
      flash[:success] = t(".success")
      redirect_to feed_path(current_feed)
    else
      @entry = entry
      flash.now[:error] = t(".failure")
      render :edit
    end
  end

  private

  def current_entry
    current_feed.entries.find(params[:id])
  end

  def current_feed
    current_user.feeds.find(params[:feed_id])
  end

  def entry_params
    params.require(:entry).permit(
      :authorship,
      :headline,
      :summary,
      :notes,
      :published_at,
      :url
    ).merge(feed: current_feed)
  end
end
