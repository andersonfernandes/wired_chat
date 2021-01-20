document.addEventListener('turbo:load', () => {
  const messages = document.querySelector('.messages')
  const chatBottomElement = document.createElement('div')
  const sendMessageButton = document.querySelector('.send-message')

  chatBottomElement.setAttribute('tabIndex', 1)
  messages.appendChild(chatBottomElement)

  chatBottomElement.focus()
  sendMessageButton.focus()
})
