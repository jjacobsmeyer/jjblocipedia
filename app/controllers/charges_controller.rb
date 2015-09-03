class ChargesController < ApplicationController

def create

  # Creates a Stripe Customer object, for associating with the charge
  customer = Stripe::Customer.create(
    email: current_user.email,
    card: params[:stripeToken]
    )

    # Where the real magic happens
    charge = Stripe::Charge.create(
      customer: customer.id, # Note -- this is NOT the user_id in your app
      amount: Amount.default,
      description: "BigMoney Membership - #{current_user.email}",
      currency: 'usd'
    )

    current_user.make_premium!

    flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
    redirect_to edit_user_registration_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def new
    @stripe_btn_data = {
      key: Rails.configuration.stripe[:publishable_key],
      description: "BigMoney Membership - #{current_user.username}",
      amount: Amount.default
    }
  end



end
