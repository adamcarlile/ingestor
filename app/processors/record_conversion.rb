class RecordConversion < Processor
  delegate :payload, to: :event

  def applicable?
    event.name == 'conversion'
  end

  def call
    Conversion.create({
      event: event,
      kind: payload.type,
      value_cents: payload.value_cents
    })
  end

end