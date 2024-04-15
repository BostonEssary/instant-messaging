class ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_authorization, only: [:show]
  def index
    @chats = Chat.all
  end

  def create
  end

  def new
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
