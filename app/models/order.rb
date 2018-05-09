class Order < ApplicationRecord
  belongs_to :service
  belongs_to :user, foreign_key: :buyer_id
end
