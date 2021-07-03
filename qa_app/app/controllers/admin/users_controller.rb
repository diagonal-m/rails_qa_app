class Admin::UsersController < ApplicationController
  layout 'second_layout'
  before_action :admin_required

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_url, notice: "ユーザー「#{@user.name}」を削除しました"
  end

  def admin_required
    redirect_to root_path unless current_user.admin
  end
end
