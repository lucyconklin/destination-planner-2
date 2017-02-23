class Api::V1::DestinationsController < ApplicationController
  def show
    render json: set_destination
  end

  private

  def set_destination
    @destination = Destination.find(params[:id])
  end
end
