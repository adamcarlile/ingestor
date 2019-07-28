class EventListener 

  def event_created(event_id)
    event = GlobalID.find(event_id)
    [UpsertCustomer, RecordConversion].map {|x| x.new(event)}.map {|x| x.applicable? && x.call }
  end

end