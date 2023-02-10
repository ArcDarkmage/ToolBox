class ChangeApartmentToString < ActiveRecord::Migration[7.0]
  def change
    change_table(:users) do |t|
      t.change :apartment, :string
    end
  end
end
