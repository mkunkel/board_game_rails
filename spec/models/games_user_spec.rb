require 'spec_helper'

describe GamesUser do
  context 'attributes' do
    it { should have_db_column(:user_id) }
    it { should have_db_column(:user_id) }
  end

  context 'associations' do
    it { should have many(:games) }
    it { should have_many(:users) }
  end
end
