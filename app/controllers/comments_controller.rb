class CommentsController < ApplicationController
  def create
    new_comment = Comment.new()
    new_comment.photo_id = params["input_photo_id"]
    new_comment.author_id = params["input_author_id"]
    new_comment.body = params["input_comment"]
    new_comment.save
    redirect_to("/photos/#{params["input_photo_id"]}")
    # Parameters: {"input_photo_id"=>"777", "input_author_id"=>"117", "input_comment"=>"pepega"}
  end
end
