# frozen_string_literal: true
class BreweriesController < ApplicationController
  ## TO DO

  # Add auth for destroy/update
  # before_action :only_respond_to_json

  def index
    @breweries = Brewery.all
    render json: @breweries
  end

  def show
    @id = params[:id]
    begin
      @brewery = Brewery.find(@id)
      render_brewery_success
    rescue
      render_not_found_error @id
     end
  end

  def create
    @brewery = Brewery.new(brewery_params)
    if @brewery.save
      render_brewery_success 'saved'
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
    @brewery = Brewery.find(params[:id])
    @brewery.destroy
    if @brewery.destroyed?
      render_brewery_success 'deleted'
    else
      render_brewery_errors
    end
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

  def render_brewery_success(success_message = "Success")
    render(json: { "status": 201, "message": "Succesfully #{success_message}", "brewery": @brewery })
  end

  def render_brewery_errors
    render json: { "errors": @brewery.errors.full_messages }, status: 422
  end

  def render_not_found_error(status)
    render json: { "message": "Brewery with id:#{@id} not found" }, status: 404
  end
end
