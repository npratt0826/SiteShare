class BookmarksController < ApplicationController

  def show
    @bookmark = Bookmark.find(params[:id])
  end
  
  def index
    @bookmarks = Bookmark.all
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)

    if @bookmark.save
      redirect_to @topic, notice: "Bookmark was saved successfully."
    else
      flash.now[:alert] = "Error creating topic. Please try again."
      render :new
    end
  end

  def edit
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:url)
  end

end
