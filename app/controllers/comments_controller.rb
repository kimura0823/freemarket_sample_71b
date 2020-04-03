class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment_params
    if comment.save
      redirect_to product_path(comment.product.id)
    else
      render product_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
