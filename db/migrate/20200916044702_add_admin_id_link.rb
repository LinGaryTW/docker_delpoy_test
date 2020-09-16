class AddAdminIdLink < ActiveRecord::Migration[6.0]
  def change
    change_table :links do |t|
      t.references :admin, foreign_key: true
    end
  end
end
