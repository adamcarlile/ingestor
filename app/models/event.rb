class Event < ApplicationRecord
  class << self
    def available_events
      @available_events ||= Hash.new(NullEvent)
    end

    def register!(key, klass)
      available_events[key] = klass
    end
  end

  delegate :available_events, to: :class

  def payload
    @payload ||= available_events[name].new(super)
  end

  def valid?
    super && payload.valid?
  end

end
