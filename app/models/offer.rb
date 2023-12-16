# frozen_string_literal: true

class Offer < ApplicationRecord

  def formatted_payout
    "$#{payout.to_f / 100}"
  end
end
