class MessagesController < ApplicationController
  before_action :set_current_user

  def index
    @chat = Chat.find(params[:chat_id])
    @messages = @chat.messages
  end
  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.new(message_params)
    @message.sender = current_user

    if @message.save

    else
      render 'chats/show', status: :unprocessable_entity

    end
  end

  def destroy
    @message = Message.find(params[:id])

    if @message.update(deleted: true, body: "Deleted @ #{Time.now.strftime("%m/%d/%Y %I:%M %p")}")
      flash.now[:notice] = 'Deleted'
    else
      render @chat, status: :unprocessable_entity
    end
  end

  def new
    @message = Message.new
  end



  private

  def message_params
    params.require(:message).permit(:body, :receiver_id, :sender)
  end

  def set_current_user
    @current_user = current_user
  end
end
