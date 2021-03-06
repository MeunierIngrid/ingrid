class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :survey

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name, uniqueness: { scope: :last_name }

  after_create :create_stripe_customer

  private

  def create_stripe_customer
    customer = Stripe::Customer.create(email:  email)
    self.stripe_id = customer.id
    self.save
  end

end
