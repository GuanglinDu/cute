class CreateMaterialOrders < ActiveRecord::Migration
  def change
    create_table :material_orders do |t|
      t.string :order_title
      t.datetime :datetime
      t.string :note
      t.references :contact, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
