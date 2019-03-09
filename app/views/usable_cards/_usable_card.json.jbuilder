json.extract! usable_card, :id, :name, :legion, :tier, :card_type, :stage, :created_at, :updated_at, :image_url, :cooldown, :cost, :squad_size, :health, :armor, :range, :damage, :attack_speed 
json.url usable_card_url(usable_card, format: :json)
