class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation

  # Display all messages for a conversation between users
  def index
    @messages = @conversation.messages

    # Update messages to read if viewed
    @messages.where("user_id != ? AND read = ?", current_user.id, false).update_all(read: true)
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    @message.user = current_user

    if @message.save
      redirect_to conversation_messages_path(@conversation)
    else
      # Guard against empty subject/body
      flash[:alert] = "Could not save message, check all fields completed"
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:conversation_id])
    end

    def message_params
      params.require(:message).permit(:body, :user_id, :subject)
    end
end
