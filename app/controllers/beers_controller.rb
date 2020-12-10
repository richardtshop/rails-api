class BeersController < ApplicationController

  def index
    @beers = Beer.all
    render json: @beers
  end

  def show
    @id = params[:id]
    begin
      @beer = Beer.find(@id)
      render json: @beer, serializer: SingleBeerSerializer
    rescue
      render_not_found_error @id
     end
  end

  def create
    @beer = Beer.new(beer_params)
    if @beer.save
      render json: @beer, status: 201
    else
      render_beer_errors
    end
  end

  def update
    @id = params[:id]
    begin
      @beer = Beer.find(@id)
      if @beer.update(beer_params)
        render_beer_success
      else
        render_beer_errors
      end
    rescue
      render_not_found_error @id
    end
  end

  def destroy
    @id = params[:id]
    begin
      @beer = Beer.find(@id)
      @beer.destroy
      if @beer.destroyed?
        render_beer_success
      else
        render_beer_errors
      end
    rescue
      render_not_found_error @id
    end
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :style, :ibu, :abv, :brewery_id)
  end

  def render_beer_success(message)
    render json: { status: message, beer: BeerSerializer.new(@beer) } , status: 200
  end

  def render_beer_errors
    render json: { "errors": @beer.errors.full_messages }, status: 422
  end

  def render_not_found_error(status)
    render json: { "error": "Beer with id:#{@id} not found" }, status: 404
  end
end
