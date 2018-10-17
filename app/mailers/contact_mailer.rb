class ContactMailer < ApplicationMailer

  def new_message(contact)
    @contact = contact

    mail(to: "contact@ingrid-meunier.fr", subject: 'Contact')
  end
end
