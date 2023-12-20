# frozen_string_literal: true

class OfferDetailSerializer < BaseJsonSerializer
  attributes :id, :start_age, :end_age, :play_hours, :age_group_id

  attribute :gender, &:formatted_gender
end
