# frozen_string_literal: true

class OfferQuery
  class << self
    def user_specific_offers(user, relation: Offer.all)
      new(user, relation: relation).user_offers
    end
  end

  def initialize(user, relation: Offer.all)
    @relation = relation
    @user = user
  end

  def user_offers
    @relation.where('? = ANY (gender)', @user.gender)
             .joins(offer_details: :age_group)
             .where(offer_details: { disabled: false })
             .where(age_group: { start_age: ..@user.age })
             .where(age_group: { end_age: @user.age.. }).uniq
  end
end
