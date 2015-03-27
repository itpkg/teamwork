require 'rss'
require 'open-uri'

namespace :teamwork do
  desc 'every day report'
  task report: :environment do

  end

  namespace :rss do
    desc 'sync rss sites'
    task sync: :environment do
      Teamwork::RssSite.select(:url).uniq.each do |rs|
        begin
          open(rs.url) do |rss|
            feed = RSS::Parser.parse rss
            rs.update title: feed.channel.title
            feed.items.each do |item|
              Teamwork::RssItem.where(site_url: rs.url, url: item.link).first_or_create do |ri|
                ri.site_url = rs.url
                ri.url = item.link
                ri.title = item.title
                ri.content = item.content_encoded || item.description
              end
            end
          end
        rescue => e
          Rails.logger.error e
        end
      end
    end
  end
end