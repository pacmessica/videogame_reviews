class GamesController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @games = @category.games
  end

  def show
    @category = Category.find(params[:category_id])
    @game = @category.games.find(params[:id])
  end
end
