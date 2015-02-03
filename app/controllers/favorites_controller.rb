class FavoritesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.build(post: @post)
    authorize @favorite

    if @favorite.save
      redirect_to :back, notice: "Favorited."
    else
      redirect_to :back, notice: "Failed to Favorite this post."
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.find(params[:id])
    authorize @favorite

    if @favorite.destroy
      redirect_to :back, notice: "Unfavorited."
    else
      redirect_to :back, notice: "Failed to unfavorite this post."
    end
  end

end
