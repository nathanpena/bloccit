class CommentsController < ApplicationController
  def create

  end

  def new
    @comment = Comment.new
  end
end
