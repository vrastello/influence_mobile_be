# frozen_string_literal: true

class User < ApplicationRecord
  require "securerandom"

  ROLES = [USER = 'user', ADMIN = 'admin'].freeze

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :username, presence: true, uniqueness: true

end
