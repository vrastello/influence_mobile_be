# frozen_string_literal: true

require 'money'

class Offer < ApplicationRecord
  has_many :offer_details, dependent: :destroy

  GENDERS = %w[male female].freeze

  validates :payout, presence: true, numericality: { greater_than: 0 }

  def formatted_payout
    Money.from_cents(payout, 'USD').format
  end

  def formatted_gender
    gender.to_sentence
  end
end
