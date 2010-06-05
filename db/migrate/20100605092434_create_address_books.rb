class CreateAddressBooks < ActiveRecord::Migration
  def self.up
    create_table :address_books do |t|
      t.string :name
      t.text :address
      t.string :city
      t.string :phone
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :address_books
  end
end
