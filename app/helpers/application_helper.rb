module ApplicationHelper
  def display_cover(book)
    book.cover.attachment.present? ? url_for(book.cover) : "logo.png"
  end

  def title(page_title)
    content_for(:title) { page_title }
  end
end
