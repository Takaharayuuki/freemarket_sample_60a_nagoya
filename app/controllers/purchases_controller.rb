class PurchasesController < ApplicationController
  before_action :set_item, only: %i[new create], if: :user_signed_in?
  before_action :set_card, only: %i[new create], if: :user_signed_in?
  before_action :redirect_to_login_form_unless_signed_in

  def new
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    @address = current_user.address.prefecture[:name] + current_user.address.city + current_user.address.house_number + current_user.address.building_name 
    @post_num_first = current_user.address.post_address.to_s.slice(0, 3)
    @post_num_last = current_user.address.post_address.to_s.slice(3, 7)
    if @card.present?
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def create
    @address = current_user.address.prefecture[:name] + current_user.address.city + current_user.address.house_number + current_user.address.building_name
    @post_num_first = current_user.address.post_address.to_s.slice(0, 3)
    @post_num_last = current_user.address.post_address.to_s.slice(3, 7)
    if @card.present?
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
      Payjp::Charge.create(
        amount: @item.price,
        customer: @card.customer_id,
        currency: 'jpy'
      )
      @item[:buyer_id] = current_user.id
      @item.save
    else
      render :new
    end
  end

  private

  def set_item
    if params[:item_id].present?
      @item = Item.find(params[:item_id])
    else
      redirect_to root_path
    end
  end
  
end