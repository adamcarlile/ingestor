require 'rails_helper'

RSpec.describe ConversionEvent do
  let(:lead_id)     { SecureRandom.uuid }
  let(:type)        { "sale" }
  let(:value_cents) { 100 }

  let(:payload) do
    {
      lead_id: lead_id,
      type: type,
      value_cents: value_cents
    }
  end

  subject { ConversionEvent.new(payload) }

  context "With a valid payload" do
    it { expect(subject.valid?).to be_truthy }
  end

  context "With an invalid payload" do
    let(:value_cents) { -100 }

    it { expect(subject.valid?).to be_falsy }
  end

end
