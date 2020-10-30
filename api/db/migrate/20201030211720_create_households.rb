class CreateHouseholds < ActiveRecord::Migration[6.0]
  def change
    create_table :households do |t|
      t.date :spent_date
      t.text :memo

      t.timestamps
    end
  end
end
