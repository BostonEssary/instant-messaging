class MessagesController < ApplicationController

  def index
    @senders = Message.select(:sender_id).distinct
    @receivers = Message.select(:receiver_id).distinct
  end
  def create
    @message = Message.new(message_params)
    @message.sender = current_user

    if @message.save
      redirect_to user_path(current_user.id)
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
