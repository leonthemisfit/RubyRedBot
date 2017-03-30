require "net/smtp"

module Mail
  class Sender
    def initialize(server, port)
      @smtp = Net::SMTP.new(server, port)
    end

    def set_auth(user, pass)
      @user = user
      @pass = pass
    end

    def send(msg, sender, recipient)
      @smtp.start() do
        @smtp.auth_login(@user, @pass)
        @smtp.send_message(msg, sender, recipient)
      end
    end
  end
end
