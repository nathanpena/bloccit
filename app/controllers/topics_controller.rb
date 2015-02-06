class TopicsController < ApplicationController
  def index
    @topics = Topic.visible_to(current_user).paginate(page: params[:page], per_page: 10).order(updated_at: :desc)
    authorize @topics
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def show
    @topic = Topic.find(params[:id])
    authorize @topic
    @posts = @topic.posts.includes(:user).includes(:comments).paginate(page: params[:page], per_page: 10)
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic  
  end

  def create
    @topic = Topic.new(topic_params)
    authorize @topic
    if @topic.save
      redirect_to @topic, notice: "Topic was saved successfully."
    else
      flash[:error] = "Error creating topic. Please try again."
      render :new
    end
  end

  def update
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.update_attributes(topic_params)
      redirect_to @topic, notice: "Topic was updated successfully"
    else
      flash[:error] = "Error saving topic.  Please try again"
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.destroy
      redirect_to topics_path, notice: "Topic was successfully deleted"
    else
      flash[:error] = "Error deleting topic.  Please try again"
      render show
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:name, :description, :public)
  end
end
