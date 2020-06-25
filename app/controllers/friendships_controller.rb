class FriendshipsController < ApplicationController
  include FriendshipsHelper
  def show; end

  def new
    @friendship = Friendship.new
  end

  # rubocop:disable Style/ConditionalAssignment
  def create
    @friendship = Friendship.new(friendship_params)
    @friendship.status = 'sent'
    @friendship_two = Friendship.new(user_id: friendship_params[:friend_id], friend_id: friendship_params[:user_id])
    @friendship_two.status = 'received'
    if @friendship.save && @friendship_two.save
      flash[:notice] = 'Friendship request sent successfully'
    else
      flash[:notice] = 'Friendship request couldn\'t be sent'
    end
    friendship_redirect
  end
  # rubocop:enable Style/ConditionalAssignment

  def update
    friendships_id = find_friendships(params[:id])
    Friendship.where(id: friendships_id).update_all(status: 'accepted')
    flash[:notice] = 'Friendship has been accepted'
    friendship_redirect
  end

  def destroy
    friendships_id = find_friendships(params[:id])
    Friendship.where(id: friendships_id).destroy_all
    flash[:notice] = 'Friendship has been rejected'
    friendship_redirect
  end

  private

  def friendship_params
    params.require(:friendship).permit(:friend_id, :user_id, :id)
  end

  def friendship_redirect
    redirect_back(fallback_location: root_path)
  end
end
