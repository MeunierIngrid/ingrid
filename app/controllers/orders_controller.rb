class OrdersController < ApplicationController
  def show
  end

  def create
    @book = Book.find(params[:book_id])
    customer = Stripe::Customer.retrieve(current_user.stripe_id)
    customer.sources.create( source: params[:stripeToken] )

    charge = Stripe::Charge.create(
      customer:     customer.id,
      amount:       @book.price_cents,
      description:  "Payment for book #{@book.title}",
      currency:     @book.price.currency
    )

    @order = Order.create(  payment: charge.to_json,
                    user: current_user,
                    book: @book,
                    amount: @book.price
                  )
    redirect_to @order

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to @book
  end
end
