# frozen_string_literal: true

class OfferSerializer < BaseJsonSerializer
  attributes :id, :title, :genre, :description

  attribute :payout, &:formatted_payout
end
