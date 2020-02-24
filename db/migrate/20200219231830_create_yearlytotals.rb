class CreateYearlytotals < ActiveRecord::Migration[6.0]
  def change
    create_table :yearlytotals do |t|
      t.integer :year
      t.decimal :profit

      t.timestamps
    end
  end
end
