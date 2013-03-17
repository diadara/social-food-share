class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end
  
  def location
    
  end

  def update_location
    @user = current_user
    if @user
      @user.longitude = params[:longitude]
      @user.lattitude = params[:lattitude]
      @user.save
      logger.info "shekjfkjsdkjf"
      redirect_to user_url(@user), :notice => "Location updated"
    else
      logger.info "else ksjgfkjsfkaj "
      redirect_to "/location", :notice => "Not updated"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if current_user == @user and @user.update_attributes(params[:user])
      redirect_to user_url(@user)
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end
end