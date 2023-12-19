# frozen_string_literal: true

class OfferDetailSerializer < BaseJsonSerializer
  attributes :id, :start_age, :end_age, :play_hours
end
