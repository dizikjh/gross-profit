class CreateMonthlytotals < ActiveRecord::Migration[6.0]
  def change
    create_table :monthlytotals do |t|
      t.integer :year
      t.integer :month
      t.decimal :extax

      t.timestamps
    end
  end
end
