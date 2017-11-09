class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

 def create

   puts "INCOMING PARAMS HERE: #{params}"

   @user = User.find_by(params[:sender])
   @topic = Topic.find_by(params[:subject])
   @url = params[:body-plain]

   if @user.nil?
     @user = User.create(email: params[:sender], password: "blocmarks")
   end

   if @topic.nil?
     @topic = Topic.create(title: params[:subject], user_id: @user)
   end

   @bookmark = @topic.bookmarks.create(url: @url)

   head 200
 end
end
