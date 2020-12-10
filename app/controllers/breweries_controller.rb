# frozen_string_literal: true
class BreweriesController < ApplicationController

  def index
    @breweries = Brewery.all
    render json: @breweries
  end

  def show
    @id = params[:id]
    begin
      @brewery = Brewery.find(@id)
      render json: @brewery, serializer: SingleBrewerySerializer

    rescue
      render_not_found_error @id
     end
  end

  def create
    @brewery = Brewery.new(brewery_params)
    if @brewery.save
      render json: @brewery, status: 201
    else
      render_brewery_errors
    end
  end

  def update
    @id = params[:id]
    begin
      @brewery = Brewery.find(@id)
      if @brewery.update(brewery_params)
        render_brewery_success 'updated'
      else
        render_brewery_errors
      end
    rescue
      render_not_found_error @id
    end
  end

  def destroy
    @id = params[:id]
    begin
      @brewery = Brewery.find(@id)
      @brewery.destroy
      if @brewery.destroyed?
        render_brewery_success 'deleted'
      else
        render_brewery_errors
      end
    rescue
      render_not_found_error @id
    end
  end

  private

  def brewery_params
    params.require(:brewery).permit(:name, :address, :city, :taproom, :restaurant, :website)
    # provide default hash wrapper if brewery not explicitly set
    # params.fetch(:brewery, {}).permit(:name, :address, :city, :taproom, :restaurant, :website)
  end

  def only_respond_to_json
    head :not_acceptable unless params[:format] == 'json'
  end

  def render_brewery_success(message)
    render json: { status: message, brewery: BrewerySerializer.new(@brewery) }, status: 200
  end

  def render_brewery_errors
    render json: { "errors": @brewery.errors.full_messages }, status: 422
  end

  def render_not_found_error(status)
    render json: { "message": "Brewery with id:#{@id} not found" }, status: 404
  end
end
