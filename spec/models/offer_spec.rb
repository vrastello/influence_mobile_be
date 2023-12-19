# frozen_string_literal: true

require "rails_helper"

RSpec.describe Offer, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:offer_details) }
  end

  context 'Validations' do
    subject { build(:offer) }

    it { is_expected.to validate_presence_of(:payout) }
    it { is_expected.to validate_numericality_of(:payout).is_greater_than(0) } 

    it 'can be saved' do
      expect(subject).to be_valid
      expect(subject.save).to be true
    end
  end

  describe '#formatted_payout' do
    subject { create(:offer, payout: 2399) }
    it 'returns formatted payout' do
      expect(subject.formatted_payout).to eq '$23.99'
    end
  end

  describe '#formatted_gender' do
    subject { create(:offer, gender: ['male', 'female']) }
    it 'returns formatted payout' do
      expect(subject.formatted_gender).to eq 'male and female'
    end
  end
end
