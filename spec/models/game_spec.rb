require 'spec_helper'
require 'pry'
describe Game do
  let(:game) {Game.new({:name => "Shadows Over Camelot",
                        :min_players => 2,
                        :max_players => 7,
                        :playing_time => 45,
                        :description => "Description of game"})}

  context 'attributes' do
    it { should have_db_column(:name) }
    it { should have_db_column(:min_players) }
    it { should have_db_column(:max_players) }
    it { should have_db_column(:playing_time) }
    it { should have_db_column(:description) }
  end

  context 'associations' do
    it { should have_many(:plays) }
  end

  context 'scopes' do
    let(:game) { Fabricate(:game) }
    let(:player) { Fabricate(:player) }

    describe '.played_by_player' do
      it 'should return games that have been played by a given player' do
        # binding.pry
        player.plays << Play.create(game_id: game.id)
        expect(Game.played_by_player(player)).to include(game)
      end

      it 'should not return games that have not been played by a given player' do
        player.plays.destroy_all
        expect(Game.played_by_player(player)).to be_empty
      end
    end
  end

  context 'class methods' do
    describe '#save' do
      it 'should save a valid game to the database' do
        game = Game.new({:name => "Shadows Over Camelot",
                          :min_players => 2,
                          :max_players => 7,
                          :playing_time => 45,
                          :description => "Description of game"})
        game.save
        Game.count.should == 1
      end
    end
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:min_players) }
    it { should validate_presence_of(:max_players) }
    it { should validate_presence_of(:playing_time) }
    it { should validate_numericality_of(:min_players) }
    it { should validate_numericality_of(:max_players) }
    it { should validate_numericality_of(:playing_time) }
    it { should validate_uniqueness_of(:name) }

    let(:game) { Fabricate(:game) }
    it 'should validate that min players is less than max players (vice versa)' do
      game.max_players = 1
      game.save
      expect(game.errors[:max_players]).to include("must be greater than or equal to min players")
      expect(game.errors[:min_players]).to include("must be less than or equal to max players")
    end
  end
end