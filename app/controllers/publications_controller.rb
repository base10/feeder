class PublicationsController < ApplicationController
  skip_before_action :require_login, only: [:index]

  def index
    if signed_in?
      @publications = current_user.publications
    end
  end

  def show
    @publication = current_publication
  end

  def new
    @publication = Publication.new
  end

  def create
    @publication = Publication.new(publication_params)

    if @publication.save
      flash[:success] = t(".success")
      redirect_to @publication
    else
      flash.now[:error] = t(".failure")
      render :new
    end
  end

  private

  def current_publication
    current_user.publications.find(params[:id])
  end

  def publication_params
    params.require(
      :publication
    ).permit(
      :name,
      :description,
      :url
    ).merge(user: current_user)
  end
end
