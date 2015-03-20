module Teamwork
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :_set_locale
    after_action :set_csrf_cookie_for_ng

    private
    def _set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def set_csrf_cookie_for_ng
      cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
    end

    def verified_request?
      super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
    end

    def default_url_options(options = {})
      {locale: I18n.locale}.merge options
    end
  end
end
