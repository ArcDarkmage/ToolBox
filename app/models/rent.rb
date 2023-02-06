class Rent < ApplicationRecord
  belongs_to :tool
  belongs_to :user
  validates :date_start, :date_end, presence: { message: "Data deve ser preenchida" }
  validate :date_start_and_date_end
  validate :available

  # validação para verificar se a data inicial é menor do que a data de hoje
  # e para verificar se a data final é menor do que a data de início"
  def date_start_and_date_end
    if date_start.nil? || date_start < Date.today
      errors.add(:date_start, "Data de início inválida")
    elsif date_end.nil? || date_start > date_end
      errors.add(:date_end, "Data final inválida")
    end
  end

  # verifica se as datas escolhidas estão disponíveis
  # se date_start ou date_end já não estão em algum range de aluguéis já existentes
  def available
    tool = Tool.find(tool_id)
    rents = tool.rents
    date_ranges = rents.map { |rent| rent.date_start..rent.date_end }
    date_ranges.each do |range|
      date_range = date_start..date_end
      range.each do |date|
        errors.add(:date_start, "Período indisponível") if date_range.include?(date)
        errors.add(:date_end, "Período indisponível") if date_range.include?(date)
      end
    end
  end

  def unavailable_dates(id)
    rents = Tool.find(id).rents
    rents.pluck(:date_start, :date_end).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
