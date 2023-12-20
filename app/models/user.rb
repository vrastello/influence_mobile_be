# frozen_string_literal: true

class User < ApplicationRecord
  # built with roles in mind, also set age to make everything easier, ideally we would want to use a
  # scheduler like sidekiq-cron and check daily for birthdays to update users age
  # was planning on implementing this but didn't want to delay the submission!
  require "securerandom"

  ROLES = [USER = 'user', ADMIN = 'admin'].freeze

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :username, presence: true, uniqueness: true
  validates :birthdate, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  validate :validate_age

  before_create { gender.downcase! }
  before_create :set_age
  before_create :set_role

  def admin?
    role == ADMIN
  end

  private

  def validate_age
    return unless birthdate && birthdate >= AgeGroup::MIN_AGE.years.ago

    errors.add(:birthdate, "must be at least #{AgeGroup::MIN_AGE} years old")
  end

  def set_age
    return unless birthdate.present?

    self.age = ((Time.current - birthdate.to_time) / 1.year.seconds).floor
  end

  def set_role
    return if role.present?

    self.role = USER
  end
end
