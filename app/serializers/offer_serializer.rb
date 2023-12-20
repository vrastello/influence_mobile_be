# frozen_string_literal: true

class OfferSerializer < BaseJsonSerializer
  attributes :id, :title, :description

  attribute :payout, &:formatted_payout

  attribute :offer_details do |offer|
    OfferDetailSerializer.serialize_collection_with_root(collection: offer.offer_details)
  end
end
