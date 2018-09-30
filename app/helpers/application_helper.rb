module ApplicationHelper
  def display_cover(book)
    book.cover.attachment.present? ? url_for(book.cover) : "logo.png"
  end
end
