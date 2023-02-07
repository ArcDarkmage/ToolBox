class AddTotalCentsToRent < ActiveRecord::Migration[7.0]
  def change
    add_column :rents, :total_cents, :integer
  end
end
