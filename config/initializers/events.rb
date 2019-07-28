Rails.application.config.to_prepare do
  Event.register!('conversion', ConversionEvent)
  Event.register!('lead', LeadEvent)
end