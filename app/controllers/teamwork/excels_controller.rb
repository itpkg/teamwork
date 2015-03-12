require_dependency 'teamwork/application_controller'

module Teamwork
  class ExcelsController < ApplicationController
    before_action :authenticate_user!

    def index
      respond_to do |fmt|
        fmt.js do
          render json: XlsFile.all
        end
        fmt.html
      end
    end

    def show

    end

    def new

    end

    def create

    end

    def edit

    end

    def update

    end

    def destroy

    end
  end
end
