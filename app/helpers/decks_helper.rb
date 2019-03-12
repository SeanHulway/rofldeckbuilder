module DecksHelper

  def legion_to_image(legion)
    if(legion == 'White')
      image_tag('Icon_legion_white.png', height: '35px', width: 'auto')
    elsif(legion == 'Black')
      image_tag('Icon_legion_black.png', height: '35px', width: 'auto')
    elsif(legion == 'Green')
      image_tag('Icon_legion_green.png', height: '35px', width: 'auto')
    else
      image_tag('Icon_legion_blue.png', height: '35px', width: 'auto')
    end
  end

  def league_to_image(league)
    if(league == 'Gold')
      image_tag('Icon_league_gold.png', height: '35px', width: 'auto')
    elsif(league == 'Silver')
      image_tag('Icon_league_silver.png', height: '35px', width: 'auto')
    elsif(league == 'Bronze')
      image_tag('Icon_league_bronze.png', height: '35px', width: 'auto')
    else
      image_tag('Icon_league_stone.png', height: '35px', width: 'auto')
    end
  end

  def link_to_card(deck)
    unless deck.blank?
      link_to usable_card_path(deck)
    end
  end

  def card_for_stats(card)
    @usable_cards.find_by(id: card)
  end

  def card_selection(deck, legion1 = {}, legion2 = {}, league = {})
    if !legion1.blank? || !legion2.blank? || !league.blank?
      if league == 'Stone'
        @usable_cards.where("(legion = ? OR legion = ?) AND tier = ?", legion1, legion2, league)
      elsif league == 'Bronze'
        @usable_cards.where("(legion = ? OR legion = ?) AND (tier = ? OR tier = 'Stone')", legion1, legion2, league)
      elsif league == 'Silver'
        @usable_cards.where("(legion = ? OR legion = ?) AND (tier = ? OR tier = 'Stone' OR tier = 'Bronze')", legion1, legion2, league)
      elsif league == 'Gold'
        @usable_cards.where("(legion = ? OR legion = ?) AND (tier = ? OR tier = 'Stone' OR tier = 'Bronze' OR tier = 'Silver')", legion1, legion2, league)
      end
    elsif deck_has_legions(deck)
      card_selection(deck, deck_has_legions(deck)[0], deck_has_legions(deck)[1], deck_has_legions(deck)[2])
    else
      @usable_cards = UsableCard.all
    end
  end

  def deck_has_legions(deck)
    if !deck.legion1.blank? || !deck.legion2.blank? || !deck.tier.blank?
      return legion1 = deck.legion1, legion2 = deck.legion2, league = deck.tier
    end
  end

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
