require 'rails_helper'

RSpec.describe UpsertCustomer do
  let(:name)          { 'lead' }
  let(:first_name)    { Faker::Name.first_name }
  let(:last_name)     { Faker::Name.last_name }
  let(:email)         { Faker::Internet.email(first_name) }
  let(:marketing)     { {} }
  let(:metadata)      { {} }
  let(:created_at)    { Time.now }
  let(:event_payload) do 
    { 
      first_name: first_name,
      last_name: last_name,
      email: email,
      marketing: marketing 
    }
  end

  let(:payload) do
    {
      name: name,
      payload: event_payload,
      metadata: metadata,
      created_at: created_at
    }
  end

  let!(:event) { Event.create(payload)}

  subject { UpsertCustomer.new(event) }

  context "Persists a customer object" do
    it { expect(subject.applicable? && subject.call).to be_truthy }

    context "customer data" do
      let(:customer) { Customer.find(event.customer_id) }
      before { subject.applicable? && subject.call }

      it { expect(event.customer_id).to be_present }
      it { expect(customer.email).to eql(event.payload.email)}
      it { expect(customer.first_name).to eql(event.payload.first_name)}
      it { expect(customer.last_name).to eql(event.payload.last_name)}
    end
  end

  context "With a non-processable payload" do
    let(:event_payload) { {} }

    it { expect(subject.applicable?).to be_falsey }
  end

end
