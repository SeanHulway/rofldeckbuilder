json.extract! card, :id, :name, :legion, :tier, :type, :stage, :created_at, :updated_at
json.url card_url(card, format: :json)
