# Ingestor

This application is designed to listen on the web root for a JSON post, with the following schemas

## Events

### Envelope

All events are wraped in this envelope. Timestamp is set by the client, but the server will set another timestamp when the event is actually `received_at`

```json
{
  "event": "lead",
  "payload": {},
  "metadata": {},
  "created_at": "Timestamp"
}
```

### Lead

Assumptions:
- Email is the unique identifier for an individual, as they may be spotted through several adverts/campaigns/forms
- After you create this lead, the return payload supplies an `event_id` that can be used to identify the lead/advert/campaign/form specific combo
- Sending another lead in with the same email, but different firstname/lastname, will cause the individual to be updated, but the existing event will have the old name

```json
{
  "event": "lead",
  "payload": {
    "first_name": "Dave",
    "last_name": "Smith",
    "email": "dave.smith@gmail.com",
    "marketing": {
      "email": true
    }
  },
  "metadata": {
    "advert_id": "1234",
    "campaign_id": "1",
    "form_id": "1",
  }
}
```

### Conversion

Assumptions:
- Conversions are for a specific lead/advers/campaign event
- 
```json
{
  "event": "conversion",
  "payload": {
    "lead_id": "uuid",
    "type": "string",
    "value_cents": 1000
  },
  "metadata": {}
}
```

## Structure

The application is designed to handle and validate the payloads passed in and store them, the actual processing of the event stream to generate some business objects happens in the processors folder.

We use wisper to broadcast the `event_created` event that triggers the processing of the stored event, right now it's done inline, however it would be easy to turn it into an async method.