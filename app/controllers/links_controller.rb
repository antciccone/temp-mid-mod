class LinksController < ApplicationController


  def index
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    @link.invalid_link?
    if @link.save
      redirect_to links_path
    end
  end

private

  def link_params
    params.require(:link).permit(:title, :url, :user_id)
  end
end
