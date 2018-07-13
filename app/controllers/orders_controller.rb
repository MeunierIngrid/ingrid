class OrdersController < ApplicationController
  def show
  end

  def create
    customer = Stripe::Customer.retrieve(stripe_id)

    charge = Stripe::Charge.create(
      customer:     customer.id,
      source:       params[:stripeToken],
      amount:       @order.price_cents,
      description:  "Payment for book #{@book.title} for order #{@order.id}",
      currency:     @order.price.currency
    )

    @order.update(payment: charge.to_json)
    redirect_to order_path(@order)

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_order_payment_path(@order)
  end
end
