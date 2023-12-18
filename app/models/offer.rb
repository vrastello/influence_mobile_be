# frozen_string_literal: true

class Offer < ApplicationRecord
  has_many :offer_details, dependent: :destroy

  GENDERS = %w[male female].freeze

  validates :payout, presence: true, numericality: { greater_than: 0 }

  def formatted_payout
    "$#{payout.to_f / 100}"
  end
end
