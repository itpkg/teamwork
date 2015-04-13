module Teamwork
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :check_session
    before_action :_set_locale

    private
    def _set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def check_session
      redirect_to main_app.new_user_session_path unless user_signed_in?
    end
  end
end
