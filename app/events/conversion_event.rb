class ConversionEvent
  include ActiveModel::Model
  include Virtus.model

  attribute :lead_id, String
  attribute :type, String
  attribute :value_cents, Integer, default: 0

  validates :lead_id, presence: true
  validates :type, presence: true
  validates :value_cents, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
