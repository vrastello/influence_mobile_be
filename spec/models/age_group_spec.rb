# frozen_string_literal: true

require "rails_helper"

RSpec.describe AgeGroup, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:offer_details) }
  end

  context 'Validations' do
    subject { build(:age_group) }

    it { is_expected.to validate_numericality_of(:end_age).is_greater_than(subject.start_age) } 
    it { is_expected.to validate_numericality_of(:start_age).is_less_than(subject.end_age) } 

    it 'can be saved' do
      expect(subject).to be_valid
      expect(subject.save).to be true
    end
  end
end
