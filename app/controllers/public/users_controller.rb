class Public::UsersController < ApplicationController
  before_action :ensure_normal_user, only: [:destroy, :update]
  before_action :authenticate_user!

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     redirect_to root_path, notice: '登録したメールアドレスに確認メールを送信しました。'
  #   else
  #     flash[:notice] = 'ユーザー登録ができませんでした。'
  #     render :new
  #   end
  # end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    user.update(user_params)
    redirect_to user_path(user)
  end

  def confirm_quit
  end

  def quit
    current_user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def favorited
    @favorites = current_user.favorites
  end

  # def confirm_email
  #   if @user = User.find_by(confirmation_token: params[:token])
  #     unless @user.expired?
  #       @user.activate
  #     end
  #   end
  # end
#
  private

    def user_params
      params.require(:user).permit(:email, :password, :name, :name_kana, :job, :graduated_at, :school_id, :country_code, :profile_image)
    end

    def ensure_normal_user
      if current_user.email == 'guest@example.com'
        flash[:notice] = "ゲストユーザーの情報変更はできません。"
        redirect_to user_path(current_user)
      end
    end

end
