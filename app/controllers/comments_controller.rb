# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:message, :user_id, :username))
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.user.id == current_user.id
      @comment.destroy
      flash[:notice] = 'Post was successfully deleted.'
    else
      flash[:notice] = 'You are not the owner of this comment'
    end
    redirect_to post_path(@post)
  end

  def edit
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.update(params[:comment].permit(:message, :user_id, :username))
    flash[:notice] = 'You updated your comment!'
    redirect_to post_path(@post)
  end
end
