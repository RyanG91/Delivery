class ChargesController < ApplicationController
  before_action :set_item


  def new
  end

  def index
  end

  def create

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount => (@service.cost * 100).to_i, #in cents
      :description => 'Rails Stripe customer',
      :currency    => 'aud'
    )

    order = Order.new
    order.buyer_id = current_user.id
    order.cost = @service.cost
    order.driver_id = @service.driver_id
    order.service_id = @service.id
    order.save

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private
    def set_item
      @service = Service.find(params[:service_id])
    end

end
