module UsersHelper
  # rubocop:disable Style/InverseMethods
  def all_users
    users = User.select { |x| x.id != current_user.id }
    users
  end
  # rubocop:enable Style/InverseMethods

  def gravatar_for(user, size: 60)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: 'gravatar')
  end

  def friends_and_i
    list = current_user.friendships.map { |x| x.friend_id if x.status }
    list += current_user.received_friendships.map { |x| x.user_id if x.status }
    list += [current_user.id]
    list
  end

  def requested_and_received
    list = current_user.friendships.map { |x| x.friend_id if x.status.nil? }
    list += current_user.received_friendships.map { |x| x.user_id if x.status.nil? }
    users = User.where(id: list)
    users
  end

  def verify_user(user)
    if user.id == current_user.id
      content_tag(:h2, "Welcome #{user.name}!")
    else
      content_tag(:div, content_tag(:h2, "Name: #{user.name}") +
                        (render 'friendship_button', user: user), class: 'button-parent')
    end
  end

  def friend_posts(user, posts)
    if friends_and_i.include? user.id
      content_tag(:h3, 'Recent posts:') +
        content_tag(:ul, (render posts), class: 'posts')
    else
      content_tag(:p, 'You don\'t have the required permition to see this user\'s posts.')
    end
  end

  def zero_notifications(users)
    content_tag(:p, 'You don\'t have notifications at the moment.') if users.count.zero?
  end

  def friends_notifications(friendship, user)
    if friendship.user_id == user.id
      render 'friendship_received_request', user: user, friendship: friendship
    else
      render 'friendship_sent_request', user: user
    end
  end
end
