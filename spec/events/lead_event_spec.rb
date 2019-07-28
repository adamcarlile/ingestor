require 'rails_helper'

RSpec.describe LeadEvent do
  let(:first_name)  { Faker::Name.first_name }
  let(:last_name)   { Faker::Name.last_name }
  let(:email)       { Faker::Internet.email(first_name) }
  let(:marketing)   { {} }

  let(:payload) do
    {
      first_name: first_name,
      last_name: last_name,
      email: email,
      marketing: marketing
    }
  end

  subject { LeadEvent.new(payload) }

  context "With a valid payload" do
    it { expect(subject.valid?).to be_truthy }
  end

  context "With an invalid payload" do
    let(:first_name) { nil }

    it { expect(subject.valid?).to be_falsy }
  end

  context "Marketing payload" do
    context "valid payload coercion" do
      let(:marketing) { { "email" => true } }

      it { expect(subject.marketing).to eql(marketing) }
    end
  end

end
