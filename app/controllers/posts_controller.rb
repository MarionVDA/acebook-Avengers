# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
    if @post.user_id != current_user.id
      flash[:notice] = 'You are not the owner of this post'
      redirect_to posts_path
    elsif @post.editable? == 'false'
      flash[:notice] = 'Post can only be updated within 10 minutes'
      redirect_to posts_path
    end
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_path, notice: 'Post was successfully created.'
  end

  def update
    if @post.user_id == current_user.id
      @post.update(post_params)
      flash[:notice] = 'Post was successfully edited.'
    else
      flash[:notice] = 'You are not the owner of this post'
    end
    redirect_to posts_url
  end

  def destroy
    if @post.user_id == current_user.id
      @post.destroy
      flash[:notice] = 'Post was successfully destroyed.'
    else
      flash[:notice] = 'You are not the owner of this post'
    end

    redirect_to posts_url
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end
