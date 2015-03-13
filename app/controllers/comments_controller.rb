class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])
    @picture = @comment.picture
    respond_to do |format|
      if @comment.save
        format.html { redirect_to pictures_path}
        format.js  {}
      end
    end

  end

  def display_picture_comments
    @comments = Comment.get_indexed_comments(params[:picture_id]).to_json
    respond_to do |format|
        format.js  
      end
  end

end
