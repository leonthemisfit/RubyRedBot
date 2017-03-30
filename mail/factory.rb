module Mail
  module Factory
    def Factory.create(from, from_addr, to, to_addr, subject, body)
      msg =
        "From: #{from} <#{from_addr}>\r\n"\
        "To: #{to} <#{to_addr}>\r\n"\
        "Orig-Date: #{Time.now}\r\n"\
        "Subject: #{subject}\r\n"\
        "\r\n\r\n"\
        "#{body}"
      return msg
    end
  end
end
