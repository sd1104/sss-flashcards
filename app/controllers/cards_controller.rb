class CardsController < ApplicationController
  def new
    @genres = Genre.all
    @cards = CardCollection.new
  end

  def create
    @cards = CardCollection.new(cards_params)
    if @cards.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @card = Card.find(params[:id])
  end

  private
  def cards_params
    params.require(:cards)
  end
end
