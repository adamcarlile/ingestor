require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:name)       { 'lead' }
  let(:payload)     { { first_name: Faker::Name.first_name } }
  let(:metadata)    { { campaign_id: 1 } }
  let(:created_at)  { Time.now }

  let(:attrs) do
    {
      name: name,
      payload: payload,
      metadata: metadata,
      created_at: created_at
    }
  end

  subject { Event.new(attrs) }

  context "Casting events correctly" do
    it { expect(subject.payload).to be_a Event.available_events[name] }
  end

  context "With a non-sensical event name" do
    let(:name) { 'nonevent' }

    it { expect(subject.valid?).to be_falsy }
  end


end
