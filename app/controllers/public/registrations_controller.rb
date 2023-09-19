class Public::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :ensure_normal_user, only: [:destroy]

  protected

    def configure_permitted_parameters
      added_attrs = [:email, :name, :country_code, :job, :is_deleted ]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    end

    def ensure_normal_user
      if resource.email == 'guest@example.com'
        flash.now[:notice] = "ゲストユーザーの削除はできません。"
        redirect_to root_path
      end
    end

end
