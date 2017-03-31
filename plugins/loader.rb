module Plugins
  class Loader
    def initialize(sock, path)
      @modules = Hash.new
      @commands = Hash.new
      @sock = sock
      Dir["#{path}/*.rb"].each do |file|
        if file != "loader.rb"
          load(file)
          mod = Plugins.get_module
          name = Plugins.get_name
          @modules[name] = mod
          self.add_commands(mod, name)
        end
      end
    end

    def add_command(command, module_name)
      @commands[command] = module_name
    end

    def add_commands(mod, module_name)
      mod.commands().each do |cmd|
        add_command(cmd, module_name)
      end
    end

    def execute_command(command, sender, arg_str)
      mod_name = @commands[command]
      if mod_name != nil
        mod = @modules[mod_name]
        mod.command(@sock, command, sender, arg_str)
      end
    end

    def check?(command)
      return @commands[command] != nil
    end
  end
end
