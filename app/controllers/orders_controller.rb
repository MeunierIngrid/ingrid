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
    @order.pdf.attach( io: open(url_for(@book.pdf)), filename: 'file.pdf' )

    redirect_to @order

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to @book
  end

  def download_pdf
    @order = Order.find(params[:id])
    if @order.downloadable_pdf?
      redirect_to cl_image_path(@order.pdf.key, flags: :attachment)
      @order.pdf.purge
    else
      redirect_to root_path
      flash[:alert] = "Ce lien n'est plus valide!"
    end
  end
end
