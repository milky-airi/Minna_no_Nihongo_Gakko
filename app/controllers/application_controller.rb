class ApplicationController < ActionController::Base
  # after_action :store_location

  # def store_location
  # # 今回の場合は、 以下のURLにアクセスしたとき＆ajaxでのやりとりはsessionには保存しない。
  #   if (request.fullpath != "/users/sign_in" && \
  #       request.fullpath != "/users/sign_up" && \
  #       request.fullpath != "/users/password" && \
  #       request.fullpath != "/admin/sign_in" && \
  #       !request.xhr?) # don't store ajax calls
  #     session[:previous_url] = request.fullpath
  #   end
  # end

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_root_path
    # else
    #   if session[:previous_url] == admin_root_path || session[:previous_url] == new_admin_session_path
    #     root_path
    #   else
    #     session[:previous_url] || root_path
    #   end
      root_path
    end
  end

end
