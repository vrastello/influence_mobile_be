# frozen_string_literal: true

require 'money'

class Offer < ApplicationRecord
  # This was designed with intention of full CRUD, however instead of delete, disable
  # this is nice sometimes when you want to keep the data around for historical analysis etc
  # since influence mobile seems heavy on marketing and data analytics I tried to think in those
  # terms.
  has_many :offer_details, dependent: :destroy

  validates :payout, presence: true, numericality: { greater_than: 0 }

  def formatted_payout
    Money.from_cents(payout, 'USD').format
  end
end
