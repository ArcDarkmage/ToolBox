class Tool < ApplicationRecord
  belongs_to :user
  has_many :rents
  validates :name, :details, :price_cents, presence: true
end
