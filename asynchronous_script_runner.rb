require 'net/http'
require 'open3'
 
class AsynchronousScriptRunner
  def execute script_url
    Thread.new {
      resp = Net::HTTP.get(URI(script_url))
      timestamp = Time.now.to_i
      file_name = "output/script_#{timestamp}.sh" 
      resp.gsub!(/\r\n?/, "\n")
      open(file_name, "w") do |file|
        file.write(resp)
      end
      
      output = File.new("output/output_#{timestamp}.txt", "w")
      puts "Starting execution"
      Open3.popen3("sh #{file_name}") do  |stdin, stdout, stderr, wait_thr|
        while line = stdout.gets || line = stderr.gets
          output.puts line
        end
      exit_status = wait_thr.value
        output.puts "Success #{exit_status.success?}"
        puts "Success #{exit_status.success?}"
      end
      output.close
    }
  end
end
