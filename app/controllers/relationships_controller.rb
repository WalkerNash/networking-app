class RelationshipsController < ApplicationController

  before_action :authenticate_user!

  def index
    @sent_invites = current_user.sent_invites
    @received_invites = current_user.received_invites
  end

  def create
    @invited_user = User.find(params[:relationship][:invited_id])

    @relationship = current_user.sent_invites.build(invited_id: @invited_user.id)

    if @relationship.save
        flash[:success] = "Successfully invited"
        # Render call here? Matchmaker Method call?
    else
        flash[:danger] = "Unsuccessful"
    end
  end

  def destroy
    @relationship = Relationship.find(params[:id])
    if @relationship.inviting_user == current_user
      @relationship.destroy
      flash[:success] = "Removed relationship"
    end
end



end
