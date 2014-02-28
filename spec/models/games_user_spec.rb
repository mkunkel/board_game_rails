require 'spec_helper'

describe GamesUser do
  context 'attributes' do
    it { should have_db_column(:user_id) }
    it { should have_db_column(:user_id) }
  end

  context 'associations' do
    it { should belong_to(:game) }
    it { should belong_to(:user) }
  end
end
