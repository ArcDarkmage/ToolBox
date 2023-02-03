class Rent < ApplicationRecord
  belongs_to :tool
  belongs_to :user
  validates :date_start, :date_end, presence: true
  validate :date_start_and_date_end
  validate :available

  def date_start_and_date_end
    if date_start < Date.today
      errors.add(:date_start, "Data de início inválida")
    elsif date_start > date_end
      errors.add(:date_end, "Data final deve ser depois da data de início")
    end
  end

  def available
    tool = Tool.find(tool_id)
    rents = tool.rents
    date_ranges = rents.map { |rent| rent.date_start..rent.date_end }
    date_ranges.each do |range|
      errors.add(:date_start, "Data indisponível") if range.include?(date_start)
      errors.add(:date_end, "Data indisponível") if range.include?(date_end)
    end
  end
end
