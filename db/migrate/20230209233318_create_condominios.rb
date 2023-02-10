class CreateCondominios < ActiveRecord::Migration[7.0]
  def change
    create_table :condominios do |t|
      t.string :name
      t.string :address
      t.string :city

      t.timestamps
    end
  end
end
