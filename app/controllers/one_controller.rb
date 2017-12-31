class OneController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @session = user_session
  end
end
