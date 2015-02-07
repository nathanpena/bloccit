class PostsController < ApplicationController
  def index
    @posts = Post.visible_to(current_user).where("posts.created_at > ?", 7.days.ago).includes(:user).includes(:votes).paginate(page: params[:page], per_page: 10)
  end
end