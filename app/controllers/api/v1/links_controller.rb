class Api::V1::LinksController < ApplicationController

  def index
    render json: Link.all
  end

  def update
    @link = Link.find(params[:id])
    @link.update(read: true)
    @link.update(counter: @link.counter + 1)
    if @link.update_attributes(link_params)
      render json: @link
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  private

  def link_params
    params.permit(:read)
  end
end
