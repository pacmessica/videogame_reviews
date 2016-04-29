class GamesController < ApplicationController
  before_filter :set_category

  def index
    @games = @category.games

    respond_to do |f|
      f.html
      f.json { render json: { category: @category, games: @games } }
    end
  end

  def show
    @game = @category.games.find(params[:id])
    render json: { game:@game }
  end


  def create
    @game = Game.new(game_params)
    @game.category = @category

    if @game.save
      render json: { game:@game, location: game_url(@game)}, status: 201
    else
      render json: { errors: @game.errors }, status:422
    end
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      render json: { game:@game }, status: 202
    else
      render json: { errors:@game.errors }, status:422
    end
  end

def destroy
  @game = Game.find(params[:id])
  if @game.destroy
    render json: { game: nil }
  else
    render json: { errors:@game.errors }
  end
end

  protected
  def game_params
    params.require(:game).permit(:title, :cover_image)
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

end
