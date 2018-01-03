class ConversationsController < ApplicationController

  def show
    @relationship = Relationship.find(params[:relationship_id])
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages
  if @messages.length > 10
   @over_ten = true
   @messages = @messages[-10..-1]
  end
  if params[:m]
   @over_ten = false
   @messages = @conversation.messages
  end
 if @messages.last
  if @messages.last.user_id != current_user.id
   @messages.last.read = true;
  end
  end
  @message = @conversation.messages.new

end

def new
 @message = @conversation.messages.new
end

  def create
    @relationship = Relationship.find(params[:relationship_id])
    @conversation = Conversation.create!(:relationship_id => @relationship)
    redirect_to relationship_conversation_path(@relationship.id, @conversation.id)
  end

end

private


def conversation_params
 params.require(:conversation).permit(:body, :relationship_id, :conversation_id, :id)
end
