# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController

  def guest_sign_in
    user = User.guest
    sign_in user
    flash.now[:notice] = "ゲストユーザーとしてログインしました。"
    redirect_to root_path
  end

end
