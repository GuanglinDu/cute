class AddIndexToContactsName < ActiveRecord::Migration
  def change
    add_index :contacts, :name, unique: true
  end
end
