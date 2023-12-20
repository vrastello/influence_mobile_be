# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do

  context 'Validations' do
    subject { build(:user, age: 10, birthdate: 11.years.ago.to_date) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_presence_of(:password_digest) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:gender) }

    it 'can be saved' do
      expect(subject).to be_valid
      expect(subject.save).to be true
      expect(subject.role).to eq User::USER
    end
  end

  context "validates age" do
    context "valid age" do
      subject { build(:user, birthdate: AgeGroup::MIN_AGE.years.ago) }

      it "is valid" do
        expect(subject).to be_valid
        expect(subject.save).to be true
      end
    end

    context "invalid age" do
      subject { build(:user, birthdate: AgeGroup::MIN_AGE.years.ago + 1.day) }

      it "is invalid" do
        expect(subject).to be_invalid
        expect(subject.save).to be false
      end
    end
  end
end
