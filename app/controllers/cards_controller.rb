class CardsController < ApplicationController
  before_action :redirect_to_login_form_unless_signed_in
  before_action :set_card, only: %i[index new show destroy]
  require "payjp"

  def index
    redirect_to card_path(current_user) if @card
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
        redirect_to card_path(current_user)
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
    @card = current_user.card if user_signed_in?
  end

end
