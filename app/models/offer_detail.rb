# frozen_string_literal: true

class OfferDetail < ApplicationRecord
  # NOTE: some of design decisions were for future extensibility
  # offer details include age group because this architecture was built with intention of having
  # full CRUD on age groups so marketers can try different age groups for offers
  # and see which ones get the most play hours, if age groups are destroyed the offer details remain.
  # This is done to retain historical data on play hours per age group (see OfferView page on FE)
  # hence the columns start_age and end_age on offer details, and optional reference to age group
  # we validate age group on create because we assume admin is trying to create live offer
  belongs_to :offer
  belongs_to :age_group, optional: true

  validates :age_group_id, presence: true, on: :create
  validates :offer_id, presence: true
  validates :play_hours, numericality: { only_integer: true, greater_than: 0 }
  after_create :set_age_range

  scope :within_age_range, lambda { |age|
    joins(:age_group)
      .where(age_group: { start_age: ..age })
      .where(age_group: { end_age: age.. })
  }

  def add_play_hours(hours)
    new_hours = play_hours + hours
    update!(play_hours: new_hours)
  end

  private

  def set_age_range
    self.start_age = age_group.start_age
    self.end_age = age_group.end_age
  end
end
