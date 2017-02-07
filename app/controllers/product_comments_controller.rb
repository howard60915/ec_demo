class ProductCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    product = Product.activated.find(params[:product_id])
    comment = current_user.comments.new(:commentable => product)
    comment.attributes = comment_params

    if comment.save
      redirect_to :back, :notice => 'Comment success'
    else
      redirect_to :back, :alert => comment.errors.full_messages.to_sentence
    end  
  end
  
  private

  def comment_params
    params.require(:comment).permit(:content, :name)
  end

end