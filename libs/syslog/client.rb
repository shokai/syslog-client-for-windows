require 'socket'

module Syslog
  class Client

    attr_reader :host, :port
    def initialize(host, port=514)
      @host = host
      @port = port
      @addr = Socket.pack_sockaddr_in @port, @host
      @udp = UDPSocket.open
    end

    DEFALUT_LOG_OPTS = {:tag => "INFO", :pid => 1234}

    def log(message, opts={})
      raise ArgumentError, "\"#{opts}\" must be Hash" unless opts.kind_of? Hash
      DEFALUT_LOG_OPTS.each do |k,v|
        opts[k] = v unless opts.has_key? k
      end
      body = "#{opts[:tag]}[#{opts[:pid]}]: #{message.strip}"
      @udp.send body, 0, @addr
      return body
    end

    def close
      @udp.close
    end

  end
end
