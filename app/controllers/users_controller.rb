class UsersController < ApplicationController

  def show
    @user = User.find_by(name: params[:id])
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
end
