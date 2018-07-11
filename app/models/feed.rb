class Feed < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :url, presence: true, uniqueness: true
end
