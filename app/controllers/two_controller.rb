class TwoController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all
    @relationships = Relationship.all
    @session = user_session
  end
end
