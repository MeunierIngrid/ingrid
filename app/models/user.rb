class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_many :anwsers

  after_create :create_stripe_customer

  private

  def create_stripe_customer
    customer = Stripe::Customer.create(email:  email)
    self.stripe_id = customer.id
    self.save
  end

end
