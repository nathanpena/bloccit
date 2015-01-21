class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(params.require(:comment).permit(:body, :user_id))

     if @comment.save
       flash[:notice] = "Comment was saved."
       redirect_to @comment
     else
       flash[:error] = "There was an error saving the comment. Please try again."
       render :new
     end
  end
end
