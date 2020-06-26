class UsersController < ApplicationController
  include UsersHelper

  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end

  def user_notifications
    @users = requested_and_received
  end
end
