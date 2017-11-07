class BookmarksController < ApplicationController

  # def show
  #   @bookmark = Bookmark.find(params[:id])
  # end

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
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.assign_attributes(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark was updated."
       redirect_to @bookmark.topic
     else
       flash.now[:alert] = "There was an error saving the bookmark. Please try again."
       render :edit
     end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.destroy
      flash[:notice] = "bookmark deleted"
      redirect_to @bookmark.topic
    else
      flash[:alert] = "There was an error deleting this bookmark"
    end
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:url)
  end

end
