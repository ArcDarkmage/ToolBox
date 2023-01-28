class CreateRents < ActiveRecord::Migration[7.0]
  def change
    create_table :rents do |t|
      t.date :date_start
      t.date :date_end
      t.references :tool, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
