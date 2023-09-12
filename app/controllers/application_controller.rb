class ApplicationController < ActionController::Base
  after_action :store_location

  def store_location
   # 今回の場合は、 /users/sign_in , /users/sign_up, /users/password にアクセスしたとき、ajaxでのやりとりはsessionには保存しない。
      if (request.fullpath != "/users/sign_in" && \
          request.fullpath != "/users/sign_up" && \
          request.fullpath != "/users/password" && \
          request.fullpath != "/admin/sign_in" && \
          !request.xhr?) # don't store ajax calls
        session[:previous_url] = request.fullpath
      end
  end

  #ログイン後のリダイレクトをログイン前のページにする
  def after_sign_in_path_for(user)
    session[:previous_url] || root_path
  end

  def after_sign_in_path_for(admin)
    admin_root_path
  end

end
