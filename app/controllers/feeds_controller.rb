class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy]

  def index
    @feeds = Feed.all
  end

  def show
  end

  def new
    @feed = Feed.new
  end

  def edit
  end

  def create
    @feed = Feed.new(feed_params)
    doc = Nokogiri::HTML(open(@feed.url))
    @feed.title = doc.at("title").text
    if @feed.save
      doc.css('item').each do |item|
        @feed.posts.create(
          title:          item.at("title").text,
          content:        item.at("description").text, 
          url:            item.at("link").next_sibling.text, 
          published_at:   item.at("pubdate").text
        )
      end
      redirect_to @feed, notice: 'Feed was successfully created.'
    else
      render :new 
    end
  end

  def update
    if @feed.update(feed_params)
      redirect_to @feed, notice: 'Feed was successfully updated.' 
    else
      render :edit
    end
  end

  def destroy
    @feed.destroy
    redirect_to feeds_url, notice: 'Feed was successfully destroyed.' 
  end

  def reader
    @posts = Post.all.order('published_at desc')
  end

  private
    def set_feed
      @feed = Feed.find(params[:id])
    end

    def feed_params
      params.require(:feed).permit(:url)
    end
end
