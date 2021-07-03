class Admin::SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: session_params[:email])

    return render(:new) unless user.admin

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to admin_questions_path, notice: 'adminユーザーとしてログインしました'
    else
      render :new
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
