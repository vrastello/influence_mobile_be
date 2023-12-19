# frozen_string_literal: true

class User < ApplicationRecord
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

  before_create :set_age
  before_create :set_role

  def admin?
    role == ADMIN
  end

  private

  def set_age
    self.age = ((Time.current - birthdate.to_time) / 1.year.seconds).floor
  end

  def set_role
    return if role.present?

    self.role = USER
  end
end
