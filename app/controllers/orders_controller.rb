require "open-uri"

class OrdersController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @order = Order.find(params[:id])
  end

  def create
    @book = Book.find(params[:book_id])
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,
      amount:       @book.price_cents,
      description:  "Payment of #{customer.email} for book #{@book.title}",
      currency:     @book.price.currency
    )

    @order = Order.create(
      payment: charge.to_json,
      email: customer.email,
      book: @book,
      amount: @book.price
    )

    OrderMailer.download_pdf(@order.id, @book.id).deliver_later

    redirect_to @order

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to @book
  end
end













