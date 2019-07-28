class UpsertCustomer < Processor
  delegate :payload, to: :event

  def applicable?
    [:email, :first_name, :last_name].all? do |method|
      payload.respond_to?(method) && payload.send(method).present?
    end
  end

  def call
    customer.update!({
      first_name: payload.first_name,
      last_name: payload.last_name
    })
    event.update!({ customer: customer })
  end

  private

  def customer
    @customer ||= Customer.find_or_initialize_by(email: payload.email)
  end

end