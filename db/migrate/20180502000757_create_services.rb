class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :service_id
      t.string :vehicle
      t.string :name
      t.string :cost
      t.string :distance
      t.string :driver_id

      t.timestamps
    end
  end
end
