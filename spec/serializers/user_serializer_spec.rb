require 'rails_helper'

RSpec.describe UserSerializer do
  subject { described_class.new(user).serializable_attributes }

  describe '#serializable_attributes' do
    let(:user) { create(:user) }

    it "includes the expected attributes" do
      expect(subject[:age]).to eq(user.age)
      expect(subject[:username]).to eq(user.username)
    end
  end
end
