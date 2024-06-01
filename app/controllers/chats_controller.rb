class ChatsController < ApplicationController
  before_action :authenticate_user!, :set_current_user
  before_action :check_authorization, only: [:show]
  def index
    @chats = Chat.all
  end

  def create
    @chat = Chat.new
    @chat.users << User.find(chat_params[:user_id])
    @chat.users << current_user

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
    @message = Message.new
  end
end

private

def chat_params
  params.require(:chat).permit(:user_id)
end

def set_current_user
  @current_user = current_user
end

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
