class AddRatingToServices < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :rating, :integer
  end
end
