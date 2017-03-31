module Inits
  module Loader
    def Loader.run(path, sock)
      Dir["#{path}/*.rb"].each do |file|
        if file != "loader.rb"
          load(file)
          Inits.run(sock)
        end
      end
    end
  end
end
