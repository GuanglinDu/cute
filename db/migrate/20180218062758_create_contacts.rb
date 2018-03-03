class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.integer :mobile
      t.string :phone
      t.integer :role, default: 1     # client
      t.integer :priority, default: 2 # ordinary
      t.string :address
      t.string :email
      t.text :note

      t.timestamps null: false
    end
  end
end
