class GroupsController < ApplicationController
  def index
  end
  
  def show
    if @group_user.group_id == params[:id].to_i
        @group = Group.find_by(id: params[:id])
    else
      redirect_to("/posts")
    end

  end

  def new
  end

  def create
    if params[:name] && params[:password]
      @group = Group.new(name: params[:name], password: params[:password], image_name: "orange.png")
      if @group.save
        @a = Group.find_by(name: params[:name])
        @b = GroupUser.new(user_id: @current_user.id, group_id: @a.id)
        @b.save
        redirect_to("/posts")
      else
        flash[:notice] = "すでに登録されているルーム名とパスワードです"
        redirect_to("/groups/new")
      end
    else
      entergroup = Group.find_by(name: params[:group_name])
      if entergroup && entergroup.authenticate(params[:password])
        @a = Group.find_by(name: params[:group_name])
        @b = GroupUser.new(user_id: @current_user.id, group_id: @a.id)
        @b.save
        redirect_to("/posts")
      else
        flash[:notice] = "ルーム名とパスワードが違います"
        redirect_to("/groups/new")
      end
    end
  end

  def update
    @group = Group.find_by(id: params[:id])
    @group.name = params[:name]
    @group.password = params[:password]
      if image = params[:image]
        @group.image_name = "#{@group.id}.jpg"
        image = params[:image]
        File.binwrite("public/group_images/#{@group.image_name}", image.read)
      end
    @group.save
    redirect_to("/posts")
  end
end
