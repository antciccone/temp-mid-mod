class LinksController < ApplicationController
  def index
    @hot_links = Link.hot
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      redirect_to links_path
    end
  end

  def destroy
    link = Link.find(params[:id])
    link.destroy
    redirect_to links_path
  end

  private

  def link_params
    params.require(:link).permit(:title, :url, :user_id)
  end
end
