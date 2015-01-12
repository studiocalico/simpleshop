class CreateOrders < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email

      t.timestamps null: false
    end

    create_table :orders do |t|
      t.integer :user_id

      t.string :status

      t.decimal :subtotal_amount, precision: 8, scale: 2
      t.decimal :shipping_amount, precision: 8, scale: 2
      t.decimal :total_amount, precision: 8, scale: 2

      t.timestamps null: false
    end
    add_index :orders, :user_id
    add_index :orders, :status

    create_table :order_items do |t|
      t.integer :order_id

      t.integer :product_id

      t.integer :quantity, null: false, default: 0
      t.string :name
      t.decimal :price, precision: 8, scale: 2

      t.timestamps null: false
    end
    add_index :order_items, :order_id

    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
