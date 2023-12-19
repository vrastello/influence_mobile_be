# frozen_string_literal: true

class OfferSerializer < BaseJsonSerializer
  attributes :id, :title, :description

  attribute :payout, &:formatted_payout

  attribute :gender, &:formatted_gender

  attribute :offer_details do |offer|
    OfferDetailSerializer.serialize_collection(collection: offer.offer_details)
  end
end
