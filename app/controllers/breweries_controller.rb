# frozen_string_literal: true
class BreweriesController < ApplicationController
  # before_action :only_respond_to_json

  def index
    @breweries = Brewery.all
    render json: @breweries
  end

  def show
  end

  def create
    @brewery = Brewery.new(brewery_params)
    if @brewery.save
      render(json: { "status": 201, "message": "Succesfully saved", "brewery": @brewery })
    else
      errors = @brewery.errors.full_messages
      render json: { "errors": errors }, status: 422
    end
  end

  def update
  end

  def destroy
  end

  private

  def brewery_params
    params.require(:brewery).permit(:name, :address, :city, :taproom, :restaurant, :website)
    # provide default hash wrapper if brewery not explicitly set
    # params.fetch(:brewery, {}).permit(:name, :address, :city, :taproom, :restaurant, :website)
  end

  def only_respond_to_json
    head(:not_acceptable) unless params[:format] == 'json'
  end
end
