class Post < ApplicationRecord
  belongs_to :feed

  scope :all_feeds_most_recent_posts, -> { joins(
    "INNER JOIN (
      SELECT DISTINCT ON (feed_id) feed_id, id FROM posts ORDER BY feed_id, published_at DESC
    ) most_recent ON (most_recent.id=posts.id) ORDER BY published_at DESC"
  )}
end
