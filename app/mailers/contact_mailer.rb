class ContactMailer < ApplicationMailer

  def new_message(contact)
    @contact = contact

    mail(to: "jonathan.serafini@gmail.com", subject: 'Contact')
  end
end
