class ThreeController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @session = user_session

  end

end
