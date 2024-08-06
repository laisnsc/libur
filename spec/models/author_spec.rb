require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it 'is expected to have unique name' do
      author = build(:author, name: 'Author')
    end
  end

  describe 'nested attributes' do
    it { is_expected.to accept_nested_attributes_for(:books) }
  end
end