# frozen_string_literal: true

module SerializedUserOffer
  extend ActiveSupport::Concern

  def serialized_user_offer
    offers = OfferQuery.user_specific_offers(@current_user)
    offer_info = OfferSerializer.serialize_collection_with_root(root: :offers, collection: offers)
    offer_info.merge(UserSerializer.new(@current_user).serialize_with_root(root: :user))
  end
end