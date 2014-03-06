require 'pusher-client'
require_relative 'config'

class PushNotificationListener

  def initialize()
    @socket = PusherClient::Socket.new(APPLICATION_KEY)
    @socket.connect(true) # Connect asynchronously
  end
  
  def subscribe channel
    @socket.subscribe(channel)  
  end

  def bind channel, event, &block
    @socket[channel].bind(event, &block)
  end  

end
