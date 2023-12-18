# frozen_string_literal: true

class OfferDetail < ApplicationRecord
  belongs_to :offer
  belongs_to :age_group

  validates :age_group_id, presence: true, on: :create
  validates :offer_id, presence: true
  after_validation :set_age_range

  private

  def set_age_range
    self.start_age = age_group.start_age
    self.end_age = age_group.end_age
  end
end
