class UsableCardsController < ApplicationController
  before_action :set_usable_card, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /usable_cards
  # GET /usable_cards.json
  def index
    if params[:legion1] && params[:legion2] && params[:tier]
      @usable_cards = UsableCard.where("(legion = ? OR legion = ?) AND tier = ?", params[:legion1], params[:legion2], params[:tier])
    else
      @usable_cards = UsableCard.all
    end
  end

  # GET /usable_cards/1
  # GET /usable_cards/1.json
  def show
  end

  # GET /usable_cards/new
  def new
    if !current_user.try(:admin?)
      redirect_to root_path
    end
    @usable_card = UsableCard.new
  end

  # GET /usable_cards/1/edit
  def edit
    if !current_user.try(:admin?)
      redirect_to root_path
    end
  end

  # POST /usable_cards
  # POST /usable_cards.json
  def create
    @usable_card = UsableCard.new(usable_card_params)

    respond_to do |format|
      if @usable_card.save!
        format.html { redirect_to @usable_card, notice: 'Usable card was successfully created.' }
        format.json { render :show, status: :created, location: @usable_card }
      else
        format.html { render :new }
        format.json { render json: @usable_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usable_cards/1
  # PATCH/PUT /usable_cards/1.json
  def update
    respond_to do |format|
      if @usable_card.update(usable_card_params)
        format.html { redirect_to @usable_card, notice: 'Usable card was successfully updated.' }
        format.json { render :show, status: :ok, location: @usable_card }
      else
        format.html { render :edit }
        format.json { render json: @usable_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usable_cards/1
  # DELETE /usable_cards/1.json
  def destroy
    @usable_card.destroy
    respond_to do |format|
      format.html { redirect_to usable_cards_url, notice: 'Usable card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def get_usable_cards_by_league
  #   @usable_cards = UsableCard.where("legion = ?", params[:legion1])
  #   respond_to do |format|
  #     format.json { render :json => @usable_cards }
  #   end
  # end 
  # def usable_card_search
  #   if params[:legion1].present? && params[:legion1].strip != ""
  #     @usable_cards = UsableCard.where("legion = ?", params[:legion1])
  #   else
  #     @usableards = UsableCard.all
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usable_card
      @usable_card = UsableCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usable_card_params
      params.require(:usable_card).permit(:name, :legion, :tier, :card_type, :stage, :image_url, :cooldown, :cost, :squad_size, :health, :armor, :range, :damage, :attack_speed, abilities_attributes: [:id, :name, :description, :_destroy])
    end
end
