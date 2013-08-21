class CommentsController < ApplicationController
  before_filter :authenticate!
  before_filter :find_establishment

  def create
    @comment = Comment.new title: params[:title], description: params[:description]
    @comment.establishment = @establishment
    @comment.user = current_user
    @comment.save

    redirect_to establishment_path(id: params[:establishment_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end

  def find_establishment
    @establishment = Establishment.find(params[:establishment_id])
  end
end
