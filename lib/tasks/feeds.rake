require 'nokogiri'
require 'open-uri'
# bundle exec rake feeds:sync_posts
namespace :feeds do
  task sync_posts: [:environment] do
    Feed.all.each do |feed|
      #http://www.ruby-lang.org/en/feeds/news.rss
      doc = Nokogiri::HTML(open(feed.url))
        doc.css('item').each do |item|
        title = item.at("title").text
        post  = feed.posts.where(title: title).first_or_initialize
        post.update_attributes(
          content:        item.at("description").text, 
          url:            item.at("link").next_sibling.text, 
          published_at:   item.at("pubdate").text
        ) if post.new_record?

        p "Synced Post - #{post.title}"
      end
      p "Synced Feed - #{feed.title}"

    end
  end
end