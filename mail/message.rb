require_relative "factory"

module Mail
  class Message
    def initialize(from, from_addr, to, to_addr, subj, body)
      @from = from_addr
      @from_name = from
      @to = to_addr
      @to_name = to
      @message = Mail::Factory.create(from, from_addr, to, to_addr, subj, body)
    end

    def new_message(subj, body)
      @message = Mail::Factory.create(@from_name, @from, @to_name, @to, subj, body)
    end

    attr_accessor :from, :to, :message
  end
end
