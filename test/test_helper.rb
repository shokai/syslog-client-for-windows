require 'rubygems'
require 'bundler/setup'
require 'minitest/autorun'

$:.unshift File.expand_path '../libs', File.dirname(__FILE__)
require 'syslog'

require 'socket'
module Syslog

  class Server

    attr_reader :port, :running

    def initialize(port=10514)
      @port = port
      @running = true
      @sock = UDPSocket.open
      @sock.bind "0.0.0.0", @port
      @data_arr = []

      Thread.new do
        while @running do
          @data_arr << @sock.recv(1024)
        end
      end
    end

    def read
      while @data_arr.empty?
        sleep 0.1
      end
      @data_arr.shift
    end

    def close
      @running = false
      @sock.close
    end

  end
end
