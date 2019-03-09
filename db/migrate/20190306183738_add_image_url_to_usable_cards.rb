class AddImageUrlToUsableCards < ActiveRecord::Migration[5.2]
  def change
    add_column :usable_cards, :image_url, :string
  end
end
