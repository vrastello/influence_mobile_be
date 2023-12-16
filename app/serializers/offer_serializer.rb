# frozen_string_literal: true

class OfferSerializer < BaseJsonSerializer
  attributes :title, :genre, :description, :tier

  attribute :payout, &:formatted_payout
end
