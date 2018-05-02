class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :order_id
      t.string :rating
      t.string :buyer_id
      t.string :driver_id
      t.string :cost
      t.string :service_id

      t.timestamps
    end
  end
end
