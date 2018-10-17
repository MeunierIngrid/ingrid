class ContactsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.new_message(@contact).deliver_now
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(
      :first_name,
      :last_name,
      :email,
      :age,
      :hp,
      :rdv,
      :informations,
      :other,
      :complement
    )
  end
end
