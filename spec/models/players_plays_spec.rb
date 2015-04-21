require 'spec_helper'
describe PlayersPlay do
  context 'attributes' do
    it { should have_db_column(:play_id) }
    it { should have_db_column(:player_id) }
  end

  context 'associations' do
    it { should have_many(:plays) }
    it { should have_many(:players) }
  end

  context 'validations' do
    it { should validate_presence_of(:player_id) }
    it { should validate_presence_of(:play_id) }
    it { should validate_numericality_of(:player_id) }
    it { should validate_numericality_of(:play_id) }
  end
end
