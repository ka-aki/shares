class UsersController < ApplicationController

  before_action :authenticate_user, {only: [:show, :edit, :update]}   
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}   

  def new
  end

  def index
    @users = User.all
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to("/posts")
  end

  def show
    user = User.find_by(id: params[:id])
    if @current_user.id == user.id
      @user = User.find_by(id: params[:id])
    else
      redirect_to("/posts")
    end
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password], sex: params[:sex])
    if params[:sex] == "女"
      @user.image_name = "sirotan.png"
    else
      @user.image_name = "tanuki.png"
    end

    if @user.save
      session[:user_id] = @user.id
      redirect_to("/groups/new")
    else
      flash[:notice] = "すでに登録されているメールアドレスとパスワードです"
      redirect_to("/users/new")
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    if image = params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end
    @user.save
    redirect_to("/posts")
  end

  def login_form
  end

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to("/posts")
    else
      flash[:notice] = "メールアドレスとパスワードが違います"
      redirect_to("/users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end

end
