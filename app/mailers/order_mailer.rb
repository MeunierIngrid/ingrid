require "open-uri"

class OrderMailer < ApplicationMailer
  def download_pdf(email, book_id)
    @email = email
    @book = Book.find(book_id)

    attachments["#{@book.title}.pdf"] = open("https://res.cloudinary.com/#{ENV['CLOUDINARY_CLOUD_NAME']}/image/upload/l_text:Times_15:#{@email},co_black,g_south,y_0.01,co_black,pg_2/#{@book.pdf.key}").read
    mail(to: @email, subject: 'Votre commande ebook')
  end
end
