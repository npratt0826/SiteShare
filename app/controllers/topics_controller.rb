class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @user = current_user
    @topic = @user.topics.build(topic_params)
    @topic.user = current_user

    if @topic.save
      redirect_to @topic, notice: "Topic was saved successfully."
    else
      flash.now[:alert] = "Error creating topic. Please try again."
      render :new
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "topic deleted"
      redirect_to topics_path
    else
      flash[:alert] = "There was an error deleting this topic"
    end
    puts "topic destroy from controller"
  end

  def edit
  end
end

private
  def topic_params
    params.require(:topic).permit(:title)
  end



# mjthompsgb+test4@gmail.com
# @sink.sendgrid.net
# %w(google.com yahoo.com facebook.com)
