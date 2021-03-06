module ChatsHelper
  def chat_name(chat)
    return chat.name if chat.pool?

    chat.other_users(current_user).first.name
  end

  def chat_info(chat)
    other_users = chat.other_users(current_user)
    return other_users.first.email if chat.personal?

    truncate "You and #{other_users.size} others"
  end

  def chat_image(chat)
    other_users = chat.other_users(current_user)
    image = chat.pool? ? 'group-chat.png' : other_users.first.image_url

    image_tag(image, class: 'is-rounded')
  end

  def chat_last_message_at(chat)
    last_message = chat.messages.first

    I18n.l(last_message.created_at, format: :short) if last_message
  end
end
