class ChangeColumnItems < ActiveRecord::Migration[6.0]
  change_table :items do |t|
      t.remove :name, :test, :quantity
      t.string :apncode, :description, :author, :pcategory, :doc_num, :ref_num
      t.decimal :rrp, :lastbuyprice, :extax_value, :tax, :discount
      t.integer :stock, :quantity
      t.date  :date
      t.time  :time
  end
end
