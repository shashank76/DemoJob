class UsersController < ApplicationController
  before_action :require_user, only: [:index]
  
  def index
  end

  def show
  end
  
  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.signup_confirmation(@user).deliver_now
      cookies.signed[:user_id] = @user.id
      redirect_to root_path
      flash[:notice] = "You have registred successfully."
    else
      flash[:error] = @user.errors.full_messages.first
      redirect_to new_user_path
    end
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:email,:password,:name,:mobile,:dob,:gender,:address,:company_name,:role)
  end

end
