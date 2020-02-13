class AddTestToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :test, :integer
  end
end
