require 'spec_helper'
describe Play do
  context 'attributes' do
    it { should have_db_column(:notes) }
    it { should have_db_column(:game_id) }
  end

  context 'associations' do
    it { should belong_to(:game) }
    it { should have_and_belong_to_many(:players) }
  end

  context 'validations' do
    it { should validate_presence_of(:game_id) }
    it { should validate_numericality_of(:game_id) }
  end
end
