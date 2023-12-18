# frozen_string_literal: true

class AgeGroup < ApplicationRecord
  has_many :offer_details

  MIN_AGE = 10

  validates :end_age, numericality: { greater_than: :start_age }
  validates :start_age, numericality: { less_than: :end_age, greater_than_or_equal_to: MIN_AGE }
end
