class PurchasesController < ApplicationController

  def new
    @item = Item.find(1)
    @address = current_user.address
    @card = current_user.card
    if @card
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def create
    @card = current_user.card
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @card_information = customer.cards.retrieve(@card.card_id)
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      amount: 300,
      customer: @card.customer_id,
      currency: 'jpy'
    )
  end

end