module IRC
  module Factory
    def Factory.pong(ping)
      return "PONG " + ping
    end

    def Factory.pass(password)
      return "PASS " + password
    end

    def Factory.user(nick, user)
      return "USER " + nick + " NULL NULL :" + user
    end

    def Factory.nick(nick)
      return "NICK " + nick
    end

    def Factory.quit(qmsg)
      return "QUIT :" + qmsg
    end

    def Factory.join(chan)
      return "JOIN " + chan
    end

    def Factory.privmsg(rec, msg)
      return "PRIVMSG " + rec + " :" + msg
    end
  end
end
