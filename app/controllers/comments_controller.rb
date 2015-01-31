class CommentsController < ApplicationController
  
  def create
    
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    authorize @comment
    if @comment.save
      redirect_to :back, notice: "Comment saved successfully."
    else
      redirect_to :back, notice: "Comment failed to save."
    end
  end

  def destroy
     
     @post = Post.find(params[:post_id])
     @topic = @post.topic
     @comment = @post.comments.find(params[:id])
 
     authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
       redirect_to :back
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
       redirect_to :back
     end
   end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end

