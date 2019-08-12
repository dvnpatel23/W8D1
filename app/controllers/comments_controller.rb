class CommentsController < ApplicationController


  def new
    @comment = Comment.new
    if params[:post_id]
      @comment.post_id = params[:post_id]
    elsif params[:comment_id]

      @comment.parent_comment_id = params[:comment_id]
      @comment.post_id = @comment.comment.post_id
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to post_url(@comment.post_id)
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :parent_comment_id)
  end

end
