class RemoveCostFromServices < ActiveRecord::Migration[5.1]
  def change
    remove_column :services, :cost, :string
  end
end
