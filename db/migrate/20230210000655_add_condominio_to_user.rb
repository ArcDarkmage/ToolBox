class AddCondominioToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :condominio
  end
end
