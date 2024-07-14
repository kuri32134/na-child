class Admin::PostsController < ApplicationController
  
  def index
    @posts = Post.all
    @leaders = Leader.all
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end

end
