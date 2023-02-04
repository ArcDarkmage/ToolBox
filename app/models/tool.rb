class Tool < ApplicationRecord
  belongs_to :user
  has_many :rents
  validates :name, :details, :price_cents, presence: true

  include PgSearch::Model

  pg_search_scope :search_by_name_and_details,
    against: %i[name details],
    using: {
      tsearch: { prefix: true }
    }
end
