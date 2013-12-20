require File.expand_path 'test_helper', File.dirname(__FILE__)

$server = Syslog::Server.new

class TestSyslogClient < MiniTest::Test

  def setup
    @logger = Syslog::Client.new "127.0.0.1", $server.port
  end

  def test_simple
    @logger.log "hello world"
    assert_equal $server.read, 'INFO[1234]: hello world'
  end

  def test_tag_pid
    @logger.log "hello work", :pid => 567, :tag => "WARN"
    assert_equal $server.read, 'WARN[567]: hello work'
  end
  
end
