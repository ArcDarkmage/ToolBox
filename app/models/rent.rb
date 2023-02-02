class Rent < ApplicationRecord
  belongs_to :tool
  belongs_to :user
  validates :date_start, :date_end, presence: true

end
