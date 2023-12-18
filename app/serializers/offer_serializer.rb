# frozen_string_literal: true

class OfferSerializer < BaseJsonSerializer
  attributes :id, :title, :description

  attribute :payout, &:formatted_payout

  attribute :gender, &:formatted_gender
end
