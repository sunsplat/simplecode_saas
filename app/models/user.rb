class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :plan
  has_one :profile
  attr_accessor :stripe_card_token #allows us to use card token created from hidden field, and use it to create a customer in Stripe server
  
  def save_with_payment
    if valid? #if user is valid, passing validations during sign-up
      # Using Stripe gem to send out information to Stripe, Stripe creates id number for customer and charges customer:
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
      self.stripe_customer_token = customer.id # customer.id is the id number created by Stripe
      save!
    end
  end
end
