class PostsController < ApplicationController
  before_action :set_feed
  before_action :set_post, only: [:show]
  def index
    @posts = @feed.posts.order('published_at desc')
  end

  def show
  end

  private

    def set_feed
      @feed = Feed.find(params[:feed_id])
    end

    def set_post
      @post = @feed.posts.find(params[:id])
    end
end