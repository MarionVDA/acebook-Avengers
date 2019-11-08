# frozen_string_literal: true

<<<<<<< HEAD
=======
# rubocop:todo Style/Documentation
>>>>>>> jordan2
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
# rubocop:enable Style/Documentation
