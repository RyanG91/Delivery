json.extract! order, :id, :order_id, :rating, :buyer_id, :driver_id, :cost, :service_id, :created_at, :updated_at
json.url order_url(order, format: :json)
