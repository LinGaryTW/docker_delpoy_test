class CreateMoney < ActiveRecord::Migration[6.0]
  def change
    create_table :money do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
