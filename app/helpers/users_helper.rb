module UsersHelper
  def has_image(card)
    unless card.blank?
      @usable_cards.find_by(id: card).image_url
    else
      image_url
    end
  end

  def image_url
    @image_url = 'https://gamepedia.cursecdn.com/riseoflegions_gamepedia_en/c/c1/Bg_white.png'
  end
end