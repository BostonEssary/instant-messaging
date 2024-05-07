class ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_authorization, only: [:show]
  def index
    @chats = Chat.all
  end

  def create
    @chat = Chat.new
    @chat.users << current_user
    @chat.users << User.find(params[:user_ids])

    if @chat.save
      redirect_to @chat
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @chat = Chat.new
  end

  def show
    @chat = Chat.find(params[:id])
    @message = @chat.messages.build
  end
end

private

def authorized?
  @chat = Chat.find(params[:id])
  @chat.users.include?(current_user)
end

def check_authorization
  unless authorized?
    flash[:error] = "You are not authorized to view this chat"
    redirect_to chats_path
  end
end
