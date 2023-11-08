class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index

    # Stripe.api_key = Rails.application.credentials.dig(:stripe, :private_key)
    # puts Stripe::Plan.list

    
  end
end
