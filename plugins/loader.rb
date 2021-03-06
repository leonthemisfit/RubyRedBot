module Plugins
  class Loader
    def initialize(sock, path)
      @modules = Hash.new
      @commands = Hash.new
      @sock = sock
      @path = path
      Dir["#{path}/*.rb"].each do |file|
        if file != "loader.rb"
          name = File.basename(file, ".rb")
          self.load_module(name)
        end
      end
    end

    def load_module(name)
      load("#{@path}/#{name}.rb")
      mod = Plugins.get_module
      @modules[name] = mod
      self.add_commands(mod)
    end

    def unload_module(name)
      mod = @modules[name]
      self.rem_commands(mod)
      @modules[name] = nil
    end

    def reload_module(name)
      self.unload_module(name)
      self.load_module(name)
    end

    def add_command(command, module_name)
      @commands[command] = module_name
    end

    def add_commands(mod)
      name = mod.name
      mod.commands().each do |cmd|
        add_command(cmd, name)
      end
    end

    def rem_command(name)
      @commands[name] = nil
    end

    def rem_commands(mod)
      mod.commands.each do |cmd|
        self.rem_command(cmd)
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
