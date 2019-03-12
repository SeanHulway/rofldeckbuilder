module UsableCardsHelper
  def legion_to_image(legion)
    if(legion == 'White')
      image_tag('Icon_legion_white.png', height: '30px', width: 'auto')
    elsif(legion == 'Black')
      image_tag('Icon_legion_black.png', height: '30px', width: 'auto')
    elsif(legion == 'Green')
      image_tag('Icon_legion_green.png', height: '30px', width: 'auto')
    else
      image_tag('Icon_legion_blue.png', height: '30px', width: 'auto')
    end
  end

  def league_to_image(league)
    if(league == 'Gold')
      image_tag('Icon_league_gold.png', height: '30px', width: 'auto')
    elsif(league == 'Silver')
      image_tag('Icon_league_silver.png', height: '30px', width: 'auto')
    elsif(league == 'Bronze')
      image_tag('Icon_league_bronze.png', height: '30px', width: 'auto')
    else
      image_tag('Icon_league_stone.png', height: '30px', width: 'auto')
    end
  end
end
