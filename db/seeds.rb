# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Feed.create({url: 'http://www.ruby-lang.org/en/feeds/news.rss'})
Feed.create({url: 'https://timesofindia.indiatimes.com/rssfeeds/1221656.cms'})