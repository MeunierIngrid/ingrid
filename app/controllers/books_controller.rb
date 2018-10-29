class BooksController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @books = Book.all.order(position: :asc)
  end

  def show
    @book = Book.find(params[:id])
  end

  def download
    @book = Book.find(params[:book_id])
    OrderMailer.download_pdf(params[:order][:email], @book.id).deliver_now

    redirect_to @book
  end
end
