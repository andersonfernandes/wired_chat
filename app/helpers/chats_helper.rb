module ChatsHelper
  def chat_name(chat)
    return chat.name if chat.pool?

    chat.users.find { |u| u.id != current_user.id }.email
  end
end
