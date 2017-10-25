class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks.all
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
