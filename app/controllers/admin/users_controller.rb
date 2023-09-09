class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :show, :edit, :update]

  def index
    @users = User.all.page(params[:page]).per(10).order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash[:notice] = "会員情報を更新しました"
      redirect_to admin_user_path(user.id)
    else
      @user = User.find(params[:id])
      render :edit
    end
  end

  private

    def user_params
      params.require(:user).permit(:is_deleted)
    end

end
