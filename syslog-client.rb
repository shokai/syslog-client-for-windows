$:.unshift File.expand_path 'libs', File.dirname(__FILE__)
require 'syslog'
require 'args_parser'
require 'kconv'

args = ArgsParser.parse ARGV do
  arg :host, 'syslog server hostname'
  arg :port, 'syslog server port', :default => 514
  arg :tag, 'tag', :default => "INFO"
  arg :pid, 'pid', :default => 1234
  arg :help, 'show help', :alias => :h

  filter :tag do |v|
    v.to_s.upcase
  end

  validate :pid, "pid must be Integer" do |v|
    v.class == Fixnum
  end

  validate :port, "port must be Integer" do |v|
    v.class == Fixnum
  end
end

if args.has_option?(:help) or !args.has_param?(:host)
  STDERR.puts "syslog client v#{Syslog::VERSION}"
  STDERR.puts "  https://github.com/shokai/syslog-client-for-windows"
  STDERR.puts
  STDERR.puts args.help
  STDERR.puts
  STDERR.puts "e.g."
  STDERR.puts "  syslog-client.exe -host syslog.example.com hello world"
  STDERR.puts "  syslog-client.exe -host syslog.example.com -tag WARN -pid 100 hello world"
  exit 1
end

logger = Syslog::Client.new args[:host], args[:port]
msg = args.argv.join(" ").toutf8
logger.log msg, :tag => args[:tag], :pid => args[:pid]
logger.close
