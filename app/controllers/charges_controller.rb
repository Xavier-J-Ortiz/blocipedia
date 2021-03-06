class ChargesController < ApplicationController
  after_action :role_to_premium, only: :create

  def create
    # Creates a Stripe Customer object, for associating
    # with the charge
    @amount = 15_00

    customer = Stripe::Customer.create(
        email: current_user.email,
        card: params[:stripeToken]
    )

    # Where the real magic happens
    charge = Stripe::Charge.create(
        customer: customer.id, # Note -- this is NOT the user_id in your app
        amount: @amount,
        description: "BigMoney Membership - #{current_user.email}",
        currency: 'usd'
    )

    flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
    redirect_to  wikis_path
      # return

      # Stripe will send back CardErrors, with friendly messages
      # when something goes wrong.
      # This `rescue block` catches and displays those errors.
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_charge_path
  end

  def new
    @stripe_btn_data = {
        key: "#{ Rails.configuration.stripe[:publishable_key] }",
        description: "BigMoney Membership - #{current_user.email}",
        amount: @amount
    }
  end

  def downgrade
    current_user.wikis.where(private: true).each { |wiki| wiki.update_attribute(:private, false) }
    set_to_standard
    redirect_to wikis_path
  end

end

private

def role_to_premium
  current_user.premium!
end

def set_to_standard
  current_user.standard!
  # redirect_to wikis_path
end

