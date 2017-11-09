class LikesController < ApplicationController

  def index
    @likes = Like.all
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    if like.save
      flash[:notice] = "You liked this site - #{@bookmark.url}"

     else
       flash.now[:alert] = "There was an error liking the site"
     end
     redirect_to @bookmark.topic
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])

    if like.destroy
      flash[:notice] = "Unliked site"
     else
       flash.now[:alert] = "There was an error unliking site"
     end
     redirect_to [@bookmark.topic]


  end
end
