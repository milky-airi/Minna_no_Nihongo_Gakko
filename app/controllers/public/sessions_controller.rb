# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :is_deleted?, only: [:create]

  def guest_sign_in
    user = User.guest
    sign_in user
    flash.now[:notice] = "ゲストユーザーとしてログインしました。"
    redirect_to root_path
  end

  protected

    def is_deleted?
      @user = User.find_by(email: params[:user][:email])
      return if !@user
      if @user.valid_password?(params[:user][:password])
        if @user.is_deleted == true
          flash[:notice] = "このアカウントは退会済みです。新規登録してください。"
        redirect_to new_user_registration_path
        else
          return
        end
      end
    end

end
