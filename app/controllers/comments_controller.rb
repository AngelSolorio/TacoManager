class CommentsController < ApplicationController
  def create
    @establishment = Establishment.find_by_id params[:establishment_id]

    @comment = Comment.new title: params[:title], description; params[:description]
    @comment.establishment = @establishment
    @comment.user = current_user
    @comment.save

    redirect_to establishment_path(id: params[:establishment_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end