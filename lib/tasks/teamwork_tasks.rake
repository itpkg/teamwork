namespace :teamwork do
  namespace :rss do
    desc 'sync rss sites'
    task sync: :environment do
      Teamwork::RssSite.all.each do |rs|
        puts rs
      end
    end
  end
end