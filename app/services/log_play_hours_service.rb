# frozen_string_literal: true

class LogPlayHoursService
  attr_reader :user, :params

  def initialize(params:, user:)
    @user = user
    @params = params
  end

  def log
    offer = Offer.find_by!(id: params[:offer_id])
    OfferQuery.offer_specific_detail_by_age(user, offer).find_each do |offer_detail|
      offer_detail.add_play_hours(params[:play_hours].to_i)
    end
  end
end
