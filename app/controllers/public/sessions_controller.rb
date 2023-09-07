# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :is_deleted?, only: [:create]

  # def create
  #   user = User.find_by(email: params[:email].downcase)
  #   if user&.authenticate(params[:password])
  #     if user.confirmed?
  #       log_in(user)
  #       redirect_to root_path, notice: 'ログインしました。'
  #     else
  #       flash[:alert] = 'メールアドレス認証を行ってください。'
  #       render :new
  #     end
  #   else
  #     flash[:alert] = 'メールアドレスかパスワードが間違っています。'
  #     render :new
  #   end
  # end

  # def resend_email_confirmation
  #   user = User.find_by(email: params[:email].downcase)
  #   if user&.authenticate(params[:password])
  #     if user.save
  #       redirect_to root_path, notice: '登録されているメールアドレスに確認メールを送信しました。'
  #     else
  #       flash[:alert] = '確認メールの再送に失敗しました。'
  #       render :new
  #     end
  #   else
  #     flash[:alert] = 'メールアドレスかパスワードが間違っています。'
  #     render :new
  #   end
  # end

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
