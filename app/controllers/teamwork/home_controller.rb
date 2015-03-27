require_dependency 'teamwork/application_controller'

module Teamwork
  class HomeController < ApplicationController
    def index
    end

    def sitemap
      xml = Rails.cache.fetch("sitemap://main/teamwork/#{locale}", expires_in: 24.hours) do
        #todo
        urls = []
        Sitemap.leaf urls
      end

      render xml: xml
    end
  end
end
