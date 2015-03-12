require_dependency 'teamwork/application_controller'

module Teamwork
  class HomeController < ApplicationController
    protect_from_forgery except: [:controllers]

    def index
    end
  end
end
