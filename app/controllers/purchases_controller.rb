class PurchasesController < ApplicationController

  def new
  end

  def create
    card = current_user.card
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      amount: 300,
      customer: card.customer_id,
      currency: 'jpy'
    )
    redirect_to 
  end

end
