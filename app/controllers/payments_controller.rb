class PaymentsController < ApplicationController

  def new

  end
  def create

    Stripe.api_key = "sk_test_41Jgr8jkqABPBPqObzBJPfTU"

    token = params[:stripeToken]

    charge = Stripe::Charge.create(
      :amount => 1000, # amount in cents, again
      :currency => "usd",
      :card => token,
      :description => "Test costomer"
   )
     redirect_to "/payments/show"
  end

  def show

  end
end
