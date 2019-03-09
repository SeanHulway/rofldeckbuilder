class UsableCard < ApplicationRecord
  has_many :abilities, dependent: :destroy, inverse_of: :usable_card
  accepts_nested_attributes_for :abilities, reject_if: :all_blank, allow_destroy: true
end
