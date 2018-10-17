class OrdersController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @order = Order.find(params[:id])
  end

  def free
    @book = Book.find(params[:book_id])
    @order = Order.create(
      payment: {
        type: "free transaction",
        email: order_params[:email],
        book_id: @book.id }.to_json,
      email: order_params[:email],
      book: @book,
      amount: @book.price
    )
    OrderMailer.download_pdf(@order.email, @book.id).deliver_now
    redirect_to @order
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

    OrderMailer.download_pdf(@order.email, @book.id).deliver_now

    redirect_to @order

  # rescue Stripe::CardError => e
  #   flash[:alert] = e.message
  #   redirect_to @book
  end

  private

  def order_params
    params.require(:order).permit(:email)
  end
end













