class UsersController < ApplicationController
  skip_before_action :login_required, only: %i[new create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    redirect_to root_path if session[:user_id]
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to questions_path, notice: "ユーザー「#{@user.name}」を登録しました"
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザー「#{@user.name}」を更新しました。"
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, notice: "ユーザー「#{@user.name}」を削除しました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation, :image)
  end
end
