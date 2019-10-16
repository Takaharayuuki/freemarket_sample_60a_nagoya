class RegistrationsController < ApplicationController
  before_action :validates_step1, only: :new2
  before_action :validates_step2, only: :new3

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
    @user = User.new
    @user.build_address
  end
  
  # def new4
  #   @user = User.new
  #   @user.build_address
  #   @address = Address.new
  #   @address.save
  # end

  # def new5
  #   session[:post_address] = address_params[:post_address]
  #   session[:prefecture] = address_params[:prefecture]
  #   session[:city] = address_params[:city]
  #   session[:house_number] = address_params[:house_number]
  #   session[:building_name] = address_params[:building_name]
  #   session[:tel] = address_params[:tel]
  #   @user = User.new
  #   binding.pry
  # end

  def create
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
    @user.build_address(user_params[:address_attributes])
  
    if @user.save
      session[:id] = @user.id
      redirect_to  new5_registrations_path
    else
      render new1_registrations_path 
    end
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
    render new1_registrations_path unless @user.valid?
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
    render new2_registrations_path unless @user.valid?
  end






  private

    def user_params
      params.require(:user).permit(:nickname,:email,:password,:password_confirmation,:encrypted_password,:reset_password_token,:reset_password_sent_at,:remember_created_at,:last_name,:first_name,:last_name_kana,:first_name_kana,:birth_day,:birth_month,:birth_year,:tel,address_attributes: [:post_address,:prefecture,:city,:house_number,:building_name,:tel])
    end

    def address_params
      params.require(:address).permit(:post_address,:prefecture,:city,:house_number,:building_name,:tel)
    end

end
