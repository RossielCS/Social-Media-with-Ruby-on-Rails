module FriendshipsHelper
  def verify_friendship(friend_id)
    status = Friendship.where('user_id = ? and friend_id = ?',
                              current_user.id, friend_id.id).first
    status
  end

  def friendship_button(user)
    friendship = verify_friendship(user)
    if friendship.nil?
      content_tag(:div,
                  (button_to 'Invite to friendship',
                             friendships_path(params: { friendship: { friend_id: user.id, user_id: current_user.id } }),
                             method: :post, class: 'button-friendship'), class: 'button-friendship')
    elsif friendship.status == 'received'
      content_tag(:div, (button_to 'Accept Friendship', friendship_path(friendship.id), method: :put) +
                          (button_to 'Reject Friendship', friendship_path(friendship.id), method: :delete))
    elsif friendship.status == 'sent'
      content_tag(:p, 'Pending Response', class: 'button-friendship status pending')
    end
  end
end
