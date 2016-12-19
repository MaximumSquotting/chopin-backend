# frozen_string_literal: true
class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :exception, unless: -> { request.format.json? }
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:address, :name, :email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:address, :name, :email])
  end
end
