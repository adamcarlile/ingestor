class LeadEvent
  include ActiveModel::Model
  include Virtus.model

  attribute :first_name, String
  attribute :last_name, String
  attribute :email, String
  attribute :marketing, Hash[String => Boolean]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

end
