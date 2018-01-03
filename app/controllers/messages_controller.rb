class MessagesController < ApplicationController

  before_action do
     @conversation = Conversation.find(params[:conversation_id])
    end

  def index

  end

def new
 @message = @conversation.messages.new
end

def create
@conversation = Conversation.find(params[:conversation_id])
 @message = @conversation.messages.create(message_params)
  redirect_to relationship_conversation_path(id: @conversation.id)

end
end

 def message_params
  params.require(:message).permit(:body, :user_id, :conversation_id, :id, :created_at, :updated_at)
 end
