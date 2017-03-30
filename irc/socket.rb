require "socket"

module IRC
  class Socket
    @host = ""
    @port = 0

    def initialize(host, port)
      @host = host
      @port = port
    end

    def connect()
      @sock = TCPSocket.new(@host, @port)
    end

    def close()
      @sock.close
    end

    def read()
      return @sock.gets
    end

    def write(msg)
      @sock.write(msg + "\r\n")
    end
  end
end
