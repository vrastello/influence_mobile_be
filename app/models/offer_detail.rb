# frozen_string_literal: true

class OfferDetail < ApplicationRecord
  # NOTE: some of design decisions were for future extensibility
  # offer details include age group because this architecture was built with intention of having
  # full CRUD on age groups so marketers can try different combinations of age groups and genders for offers
  # when admin creates new offer, they select from available age groups and genders and offer detail is created
  # Offer detail can be disabled later, so if needed it can be reactivated and we don't lose that data.
  # admins can play around and see waht combos get the most play hours, if age groups are destroyed the offer details
  # remain but they are not shown to the users, this also makes it easy to remove an age group from all offers globally
  # This is done to retain historical data on play hours per age group (see OfferView page on FE)
  # hence the columns start_age and end_age on offer details, and optional reference to age group
  # we validate that age group is present on create because we assume admin is trying to create live offer
  belongs_to :offer
  belongs_to :age_group, optional:

  GENDERS = %w[male female].freeze

  validates :age_group_id, presence: true, on: :create
  validates :offer_id, presence: true
  validates :play_hours, numericality: { only_integer: true, greater_than: 0 }
  after_create :set_age_range
  before_save :format_gender

  scope :within_user_gender, ->(gender) { where('? = ANY (gender)', gender) }

  scope :within_user_age, lambda { |age|
    joins(:age_group)
      .where(age_group: { start_age: ..age })
      .where(age_group: { end_age: age.. })
  }

  def add_play_hours(hours)
    new_hours = play_hours + hours
    update!(play_hours: new_hours)
  end

  def formatted_gender
    gender.to_sentence
  end

  private

  def format_gender
    self.gender = gender.map(&:downcase).sort!
  end

  def set_age_range
    self.start_age = age_group.start_age
    self.end_age = age_group.end_age
    save!
  end
end
