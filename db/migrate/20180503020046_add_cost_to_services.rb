class AddCostToServices < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :cost, :float
  end
end
