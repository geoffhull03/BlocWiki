class ChargesController < ApplicationController

    def create
        # Creates a Stripe Customer object, for associating
        # with the charge
        customer = Stripe::Customer.create(
            email: current_user.email,
            card: params[:stripeToken]
        )

        # Where the real magic happens
        charge = Stripe::Charge.create(
            customer: customer.id, # Note -- this is NOT the user_id in your app
            amount: 15_00,
            description: "Blocipedia Premium - #{current_user.email}",
            currency: 'usd'
        )

        flash[:success] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
        current_user.update_attribute(:role, 'premium')
        redirect_to edit_user_registration_path # or wherever

        rescue Stripe::CardError => e
        flash[:alert] = e.message
        current_user.update_attribute(:role, 'standard')
        redirect_to new_charge_path
    end

    def new
        @stripe_btn_data = {
            key: "#{ Rails.configuration.stripe[:publishable_key] }",
            description: "Blocipedia Premium - #{current_user.email}",
            amount: 15_00
        }
    end

    def unsub
        flash[:success] = "Your subscription has been cancelled..Thank you nothin', jerk!."
        current_user.wikis.where(private: true).update_all(private: false)
        current_user.update_attribute(:role, 'standard')
        redirect_to edit_user_registration_path
    end
end
