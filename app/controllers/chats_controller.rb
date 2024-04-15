class ChatsController < ApplicationController
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
