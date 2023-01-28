class CreateTools < ActiveRecord::Migration[7.0]
  def change
    create_table :tools do |t|
      t.string :name
      t.text :details
      t.integer :price_cents
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
