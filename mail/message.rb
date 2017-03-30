require_relative "factory"

module Mail
  class Message
    def initialize(from, from_addr, to, to_addr, subj, body)
      @from = from_addr
      @to = to_addr
      @message = Mail::Factory.create(from, from_addr, to, to_addr, subj, body)
    end

    attr_accessor :from, :to, :message
  end
end
