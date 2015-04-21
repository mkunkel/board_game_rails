require 'spec_helper'
describe Player do
  before(:each) do
  end

  context 'attributes' do
    it { should have_db_column(:name) }
  end

  context 'associations' do
    it { should have_and_belong_to_many(:plays) }
  end

  context 'class methods' do
  end

  context 'instance methods' do
    describe 'valid?' do
    end
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
