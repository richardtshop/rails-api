class BeersController < ApplicationController

  def index
    @beers = Beer.all
    render json: @beers
  end

  # def show
  #   @id = params[:id]
  #   begin
  #     @beer = Beer.find(@id)
  #     render_beer_success
  #   rescue
  #     render_not_found_error @id
  #    end
  # end

  def create
    @beer = Beer.new(beer_params)
    if @beer.save
      render_beer_success 'saved'
    else
      render_beer_errors
    end
  end

  # def update
  #   @id = params[:id]
  #   begin
  #     @beer = Beer.find(@id)
  #     if @beer.update(beer_params)
  #       render_beer_success 'updated'
  #     else
  #       render_beer_errors
  #     end
  #   rescue
  #     render_not_found_error @id
  #   end
  # end

  # def destroy
  #   @beer = Beer.find(params[:id])
  #   @beer.destroy
  #   if @beer.destroyed?
  #     render_beer_success 'deleted'
  #   else
  #     render_beer_errors
  #   end
  # end

  private

  def beer_params
    params.require(:beer).permit(:name, :style, :ibu, :abv, :brewery_id)
  end

  def render_beer_success(success_message = "Success")
    render(json: { "status": 201, "message": "Succesfully #{success_message}", "beer": @beer })
  end

  def render_beer_errors
    render json: { "errors": @beer.errors.full_messages }, status: 422
  end

  def render_not_found_error(status)
    render json: { "message": "Beer with id:#{@id} not found" }, status: 404
  end


end
