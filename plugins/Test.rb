require_relative "../irc/factory"

module Plugins
  module Test
    def Test.commands()
      return ["$test"]
    end

    def Test.name()
      return "Test"
    end

    def Test.command(sock, command, sender, arg_str)
      if arg_str == ""
        sock.write(IRC::Factory.privmsg(sender, "TEST"))
      else
        sock.write(IRC::Factory.privmsg(sender, arg_str))
      end
    end
  end

  def Plugins.get_module()
    return Plugins::Test
  end
end
