class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @decks  = @user.decks.order("created_at DESC").page(params[:page]).per(25)
    @usable_cards = UsableCard.all
  end
end
