class DecksController < ApplicationController
  before_action :set_deck, only: [:show, :edit, :update, :destroy]
  before_action :all_cards

  # GET /decks
  # GET /decks.json
  def index
    @decks = Deck.all
  end

  # GET /decks/1
  # GET /decks/1.json
  def show
  end

  # GET /decks/new
  def new
    @deck = Deck.new
    @image_url = 'https://gamepedia.cursecdn.com/riseoflegions_gamepedia_en/c/c1/Bg_white.png'
  end

  # GET /decks/1/edit
  def edit
    @image_url = 'https://gamepedia.cursecdn.com/riseoflegions_gamepedia_en/c/c1/Bg_white.png'
  end

  # POST /decks
  # POST /decks.json
  def create
    @deck = Deck.new(deck_params)

    respond_to do |format|
      if @deck.save
        format.html { redirect_to @deck, notice: 'Deck was successfully created.' }
        format.json { render :show, status: :created, location: @deck }
      else
        format.html { render :new }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /decks/1
  # PATCH/PUT /decks/1.json
  def update
    respond_to do |format|
      if @deck.update(deck_params)
        format.html { redirect_to @deck, notice: 'Deck was successfully updated.' }
        format.json { render :show, status: :ok, location: @deck }
      else
        format.html { render :edit }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decks/1
  # DELETE /decks/1.json
  def destroy
    @deck.destroy
    respond_to do |format|
      format.html { redirect_to decks_url, notice: 'Deck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def find_card_id_by_name(name)
    Card.find_by_name(name).id
  end

  def refresh_cards
    @legion1 = params[:legion1]
    @legion2 = params[:legion2]
    @league = params[:league]

    if Deck.find_by_id(params[:id])
      set_deck
    else
      @deck = Deck.new
    end

    @usable_cards = UsableCard.all

    respond_to do |format|
      format.js
    end
  end

  private

    def all_cards
      @usable_cards = UsableCard.all
      @cards_by_name = Array.new(@usable_cards.length)

      @usable_cards.each do |card|
        @cards_by_name[card.id] = card.name
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_deck
      @deck = Deck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deck_params
      params.require(:deck).permit(:name, :legion1, :legion2, :tier, :description, :card_1, :card_2, :card_3, :card_4, :card_5, :card_6, :card_7, :card_8, :card_9, :card_10, :card_11, :card_12)
    end
end
