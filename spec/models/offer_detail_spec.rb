# frozen_string_literal: true

require "rails_helper"

RSpec.describe OfferDetail, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:offer) }
    it { is_expected.to belong_to(:age_group).optional }
  end

  context 'Validations' do
    let(:age_group) { create(:age_group) }
    subject { build(:offer_detail, age_group: age_group) }

    it { is_expected.to validate_presence_of(:age_group_id).on(:create) }
    it { is_expected.to validate_presence_of(:offer_id) }
    it { is_expected.to validate_numericality_of(:play_hours).is_greater_than(0) }

    it 'can be saved' do
      expect(subject).to be_valid
      expect(subject.save).to be true
    end
  end

  describe '#add_play_hours' do
    subject { create(:offer_detail, play_hours: 10) }

    it "adds play hours to offer detail" do
      expect(subject.add_play_hours(5)).to eq true

      subject.reload

      expect(subject.play_hours).to eq 15
    end
  end

  describe "set_age_range" do
    let(:age_group) { create(:age_group) }
    subject { create(:offer_detail, age_group: age_group) }

    it "adds age range to offer detail" do
      expect(subject.start_age).to eq age_group.start_age
      expect(subject.end_age).to eq age_group.end_age
    end
  end
end
