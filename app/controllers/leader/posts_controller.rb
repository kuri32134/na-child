class Leader::PostsController < ApplicationController
  before_action :authenticate_leader!
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.leader_id = current_leader.id
    if @post.save
      redirect_to leader_posts_path
    else
      render :new
    end

  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to leader_post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to leader_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

end
