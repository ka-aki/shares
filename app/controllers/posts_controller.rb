class PostsController < ApplicationController

  before_action :authenticate_user

  def index
    @posts = Post.all.order(created_at: :desc)

    @group = GroupUser.find_by(user_id: @current_user.id)
    @group_id = @group.group_id  
  end

  def create
    @a = GroupUser.find_by(user_id: @current_user.id)
    @b = @a.group_id
    @post = Post.new(content: params[:content], user_id: @current_user.id, group_id: @b)
    @post.save
    redirect_to("/posts")
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.save
    redirect_to("/posts")
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts")
  end
end
