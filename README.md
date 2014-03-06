Remote Bash Script Executer
====================

Remotely execute any bash script by giving a url (ex: http://pastebin.com/raw.php?i=vFSATd0e) to the bash script using Pusher (http://pusher.com/)

Steps:
-------
1. Create config.rb and assign your pusher application key to 'APPLICATION_KEY'
2. Start daemon.rb by running 'ruby daemon.rb'
3. Go to your Pusher app debug console and send the url of the bash script to be executed. Channel name should be 'command' and Event name should be 'execute-bash'
4. Go to output folder to see the output of the script executed
