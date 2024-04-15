class MessagesController < ApplicationController

  def index
    @chat = Chat.find(params[:chat_id])
    @messages = @chat.messages
  end
  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.new(message_params)
    @message.sender = current_user

    if @message.save
      redirect_to @chat
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @message = Message.new
  end



  private

  def message_params
    params.require(:message).permit(:body, :receiver_id, :sender)
  end
end
