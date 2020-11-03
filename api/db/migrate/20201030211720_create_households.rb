class CreateHouseholds < ActiveRecord::Migration[6.0]
  def change
    create_table :households do |t|
      t.date :spent_date, null: false
      t.integer :amount, null: false
      t.text :memo

      t.timestamps
    end
  end
end
