class  Api::V1::Links::TopController < ApplicationController

  def index
    render json: Link.top_ten
  end
end
