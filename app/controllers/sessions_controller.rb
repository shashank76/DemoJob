class SessionsController < ApplicationController
  def new
    redirect_to jobs_path if current_user.present?
  end

  def create
    if @user = User.find_by(email: params[:session][:email])
      if @user && @user.valid_password?(params[:session][:password])
          @user.update_attributes(sign_in_count: @user.sign_in_count+1,last_sign_in_at: Time.current)
					if params[:session][:remember_me].eql?("1")
            cookies.signed[:user_id] = {value: @user.id, expires: 4.weeks.from_now}
          else
            cookies.signed[:user_id] = @user.id
          end
          flash[:notice] = "You have successfully logged In."
          redirect_to jobs_path
      else
     		redirect_to new_session_path
        flash[:error] = "Invalid Password, Please try again."
      end 
    else
      redirect_to new_session_path
      flash[:error] = "Invalid Email, Please try again."
    end
	end

	def destroy
	    session[:user_id] = nil
	    cookies.delete :user_id
	    flash[:notice] = "You have successfully logged out."
	    redirect_to new_session_path
	end
end
