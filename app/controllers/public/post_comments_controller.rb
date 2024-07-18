class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    post = Post.find(params[:post_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = post.id
    if comment.comment.blank?
      redirect_to public_post_path(post.id), flash: { error: "コメントを入力してください。" }
    elsif comment.save
      redirect_to public_post_path(post), notice: "コメントが投稿されました。"
    else
      redirect_to public_post_path(post.id)
    end
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to public_post_path(params[:post_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
