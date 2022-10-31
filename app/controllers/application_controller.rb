class ApplicationController < ActionController::Base

  # before_actionでdevise機能利用前に"configure_permitted_parameters"メソッドが実行される
  before_action :configure_permitted_parameters, if: :devise_controller?

    # サインイン後の遷移先を設定
    def after_sign_in_path_for(resource)
      about_path
    end

    # サインアウト後の遷移先を設定
    def after_sign_out_path_for(resource)
      about_path
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
