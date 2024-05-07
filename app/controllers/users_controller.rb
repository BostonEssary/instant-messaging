class UsersController < ApplicationController

  def index
    if params[:query]
      @users = User.where("username LIKE ?", params[:query] + "%")
    else
      @users = User.all
    end

    respond_to do |format|
      format.turbo_stream
      format.html
    end

  end
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end
end
