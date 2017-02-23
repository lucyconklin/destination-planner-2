class Api::V1::DestinationsController < ApplicationController
  def index
    render json: Destination.all
  end

  def show
    render json: set_destination
  end

  def create
    destination = Destination.new(destination_params)
    if !destination.save
      render :json => { :errors => destination.errors.full_messages }
    else
      destination.save
    end
  end

  def update
    destination = Destination.find(params[:id])
    if !destination.update(destination_params)
      render :json => { :errors => destination.errors.full_messages }
    else
      destination.update(destination_params)
    end
  end

  def destroy
    destination = Destination.find(params[:id])
    destination.destroy
  end

  private

  def set_destination
    @destination = Destination.find(params[:id])
  end

  def destination_params
    params.require(:destination).permit(:name, :zip, :description, :image_url)
  end
end
