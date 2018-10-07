require "open-uri"

class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.download_pdf.subject
  #
  def download_pdf(order_id, book_id)
    @order = Order.find(order_id)
    @book = Book.find(book_id)

    attachments["#{@book.title}.pdf"] = open("https://res.cloudinary.com/#{ENV['CLOUDINARY_CLOUD_NAME']}/image/upload/l_text:Times_15:#{@order.email},co_black,g_south,y_0.01,co_black,pg_2/#{@book.pdf.key}").read
    mail(to: @order.email, subject: 'Votre commande ebook')
  end
end

  def welcome(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: 'Welcome to Le Wagon')
    # This will render a view in `app/views/user_mailer`!
  end
