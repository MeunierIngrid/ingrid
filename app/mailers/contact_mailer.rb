class ContactMailer < ApplicationMailer

  def new_message(contact)
    @contact = contact

    mail(to: "contact@ingrid-meunier.fr", subject: "Contact: #{@contact.full_name}")
  end
end
