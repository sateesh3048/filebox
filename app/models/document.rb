require 'securerandom'
class Document < ApplicationRecord
  # associations
  has_one_attached :file
  belongs_to :user

  # Validations

  def generate_shorten_url
    return self if short_url.present?

    self.short_url = SecureRandom.alphanumeric(6)
    save
    self
  end
end
