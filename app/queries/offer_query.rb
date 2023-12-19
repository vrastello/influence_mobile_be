# frozen_string_literal: true

class OfferQuery
  # by checking age groups on each query we ensure the the offer is still available
  # for the users age, this app was built with intention of allowing full CRUD on age groups
  attr_reader :user
  attr_reader :offer

  class << self
    def user_specific_offers(user, relation: Offer.all)
      new(user, nil, relation: relation).user_offers
    end

    def offer_specific_detail_by_age(user, offer, relation: OfferDetail.all)
      new(user, offer, relation: relation).offer_detail_by_age
    end
  end

  def initialize(user, offer, relation:)
    @user = user
    @offer = offer
    @relation = relation
  end

  def user_offers
    @relation.where('? = ANY (gender)', user.gender)
             .joins(:offer_details)
             .where(offer_details: { disabled: false })
             .merge(OfferDetail.within_age_range(user.age))
             .order(:title).uniq
  end

  def offer_detail_by_age
    @relation.where(offer: offer)
             .merge(OfferDetail.within_age_range(user.age))
  end
end
