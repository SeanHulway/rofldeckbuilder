class Deck < ApplicationRecord
  belongs_to :user

  def self.search(legion1, legion2, league)
    if !legion1.blank? && !legion2.blank?  && !league.blank?
      if (legion1 == 'All Legions' && legion2 == 'All Legions' && league == 'All Leagues')
        all
      elsif (legion1 != 'All Legions' && legion2 != 'All Legions' && league == 'All Leagues')
        all.where('(legion1 = ? OR legion1 = ?) AND (legion2 = ? OR legion2 = ?)', legion1, legion2, legion1, legion2)
      elsif (legion1 != 'All Legions' && legion2 == 'All Legions' && league != 'All Leagues')
        all.where('((legion1 = ?) OR (legion2 = ?)) AND (tier = ?)', legion1, legion1, league)
      elsif (legion1 == 'All Legions' && legion2 != 'All Legions' && league != 'All Leagues')
        all.where('((legion1 = ?) OR (legion2 = ?)) AND (tier = ?)', legion2, legion2, league)
      elsif (legion1 != 'All Legions' && legion2 == 'All Legions' && league == 'All Leagues')
        all.where('(legion1 = ?) OR (legion2 = ?)', legion1, legion1)
      elsif (legion1 == 'All Legions' && legion2 != 'All Legions' && league == 'All Leagues')
        all.where('(legion1 = ?) OR (legion2 = ?)', legion2, legion2)
      elsif (legion1 == 'All Legions' && legion2 == 'All Legions' && league != 'All Leagues')
        all.where('tier = ?', league)
      else
        all.where('(legion1 = ? OR legion1 = ?) AND (legion2 = ? OR legion2 = ?) AND tier = ?', legion1, legion2, legion1, legion2, league)
      end
    elsif !legion1.blank? && !legion2.blank? && league.blank?
      all.where('(legion1 = ? OR legion1 = ?) AND (legion2 = ? OR legion2 = ?)', legion1, legion2, legion1, legion2)
    
    elsif !legion1.blank? && legion2.blank? && !league.blank?
      all.where('((legion1 = ?) OR (legion2 = ?)) AND (tier = ?)', legion1, legion1, league)
    
    elsif legion1.blank? && !legion2.blank? && !league.blank?
      all.where('((legion1 = ?) OR (legion2 = ?)) AND (tier = ?)', legion2, legion2, league)
    
    elsif !legion1.blank? && legion2.blank? && league.blank?
      all.where('(legion1 = ?) OR (legion2 = ?)', legion1, legion1)
    
    elsif legion1.blank? && !legion2.blank? && league.blank?
      all.where('(legion1 = ?) OR (legion2 = ?)', legion2, legion2)
    
    elsif legion1.blank? && legion2.blank? && !league.blank?
      all.where('tier = ?', league)
    else
      all
    end
  end
end
