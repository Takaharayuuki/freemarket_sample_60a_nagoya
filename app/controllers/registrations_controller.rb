class RegistrationsController < ApplicationController
  before_action :validates_step1, only: :new2
  before_action :validates_step2, only: :new3
  before_action :redirect_to_root_user_signed_in


  def new
  end

  def new1
    @user = User.new
  end

  def new2
    session[:id] = user_params[:id]
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birth_day] = user_params[:birth_day]
    session[:birth_year] = user_params[:birth_year]
    session[:birth_month] = user_params[:birth_month]
    @user = User.new
  end

  def new3
    session[:tel] = user_params[:tel]
    @address = Address.new
  end
  
  def new4
    session[:post_address] = address_params[:post_address]
    session[:prefecture] = address_params[:prefecture]
    session[:city] = address_params[:city]
    session[:house_number] = address_params[:house_number]
    session[:building_name] = address_params[:building_name]
    session[:tel] = address_params[:tel]
    @card = Card.new
  end


  def create
    session[:payjp_token] = params['payjp-token']
    @user = User.new(
      id: session[:id],
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birth_day: session[:birth_day],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      tel: session[:tel]
    )
  
    if @user.save
      session[:user_id] = @user.id
      @address = Address.new(
        post_address: session[:post_address],
        prefecture: session[:prefecture],
        city: session[:city],
        house_number: session[:house_number],
        building_name: session[:building_name],
        tel: session[:tel],
        user_id: session[:user_id]
      )
      if @address.save
        Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
        if session[:payjp_token].blank?
          redirect_to action: "new4"
        else
          customer = Payjp::Customer.create(
            description: "test",
            email: session[:email],
            card: session[:payjp_token],
            metadata: {user_id: @user.id}
          )
          @card = Card.new(user_id: @user.id, customer_id: customer.id, card_id: customer.default_card)
          if @card.save
            sign_in @user
          else
            render new4_registrations_path
          end
        end
      else
        render new3_registrations_path
      end
    else
      render new1_registrations_path
    end
    render new5_registrations_path
  end

  def new5
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  def validates_step1
    session[:id] = user_params[:id]
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birth_day] = user_params[:birth_day]
    session[:birth_year] = user_params[:birth_year]
    session[:birth_month] = user_params[:birth_month]
    @user = User.new(
      id: session[:id],
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birth_day: session[:birth_day],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
    )
    render new1_registrations_path unless @user.valid?(:validates_step1)
  end

  def validates_step2
    session[:tel] = user_params[:tel]
    @user = User.new(
      id: session[:id],
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birth_day: session[:birth_day],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      tel: session[:tel]
    )
    render new2_registrations_path unless @user.valid?(:validates_step2)
  end

  

  private

    def user_params
      params.require(:user).permit(:nickname,:email,:password,:password_confirmation,:encrypted_password,:reset_password_token,:reset_password_sent_at,:remember_created_at,:last_name,:first_name,:last_name_kana,:first_name_kana,:birth_day,:birth_month,:birth_year,:tel,address_attributes: [:post_address,:prefecture,:city,:house_number,:building_name,:tel])
    end

    def address_params
      params.require(:address).permit(:post_address,:prefecture,:city,:house_number,:building_name,:tel)
    end

    def redirect_to_root_user_signed_in
      redirect_to root_path if user_signed_in?
    end

end
