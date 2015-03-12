module Teamwork
  module ApplicationHelper
    def self.top_nav_links
      [
          {url: Teamwork::Engine.routes.url_helpers.home_path(locale: ::I18n.locale), name:I18n.t('teamwork.titles.home')},
      ]
    end
  end
end
