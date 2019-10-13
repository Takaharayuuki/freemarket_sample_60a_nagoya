class ItemsController < ApplicationController
  require 'payjp'

  def index
  end

  def confirm
  end

  def payment
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      amount: 300,
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end

  

end
