class CardsController < ApplicationController
  before_action :set_card, only: %i[index new show destroy]
  require "payjp"

  def index
    redirect_to card_path(current_user.id) if @card
  end

  def new
    redirect_to action: "index" if @card.present?
  end

  def create
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        description: "test",
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to card_path(current_user.id)
      else
        render :new
      end
    end

  end

  def show
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @card_information = customer.cards.retrieve(@card.card_id)
  end

  def destroy
    if @card
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
      render :index
    end
  end

  private
  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

end
