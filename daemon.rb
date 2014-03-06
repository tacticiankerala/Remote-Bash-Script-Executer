require_relative 'push_notification_listener'
require_relative 'asynchronous_script_runner'

class Daemon
  def start
    listen_for_command
    keep_alive
  end

  def listen_for_command
    push_notification_listener = PushNotificationListener.new
    push_notification_listener.subscribe "command"
    push_notification_listener.bind "command", "execute-bash" do |script_url|
      AsynchronousScriptRunner.new.execute script_url
    end
  end
  
  def keep_alive
    loop do
      sleep 1
    end
  end
end

Daemon.new.start
