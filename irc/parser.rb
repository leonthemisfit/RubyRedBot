module IRC
  module Parser
    def Parser.parse(raw)
      parts = raw.split

      prefix = ""
      command = ""
      args = []

      if parts[0][0] == ":"
        prefix = parts.shift
        prefix = prefix[1..prefix.length-1]
      end

      command = parts.shift

      parts.each_with_index do |part, i|
        if part[0] != ":"
          args << part
        else
          line = parts[i..parts.length-1].join(" ")
          line = line[1..line.length-1]
          args << line
          break
        end
      end

      return prefix, command, args
    end
  end
end
