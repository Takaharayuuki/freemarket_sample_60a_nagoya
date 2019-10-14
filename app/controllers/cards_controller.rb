class CardsController < ApplicationController
  require "payjp"

  def index
    card = Card.where(user_id: params[:id]).first
  end

  def new
    card = Card.where(user_id: params[:id]).first
    redirect_to action: "index" if card.present?
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
        render :index
      else
        render :new
      end
    end
    # Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    # session[:payjp_token] = params['payjp-token']
    # customer = Payjp::Customer.create(
    #   card: session[:payjp_token],
    #   metadata: { user_id: current_user.id }
    # )
    # @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
    # if @card.save
    #   redirect_to edit_card_path(current_user.id)
    # else
    #   render :new
    # end

  end

  def destroy
    card = Card.where(user_id: current_user.id).first
    if card
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
  end

end
