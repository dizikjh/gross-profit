class DropProductsTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :portfolios
    drop_table :tests
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
