require 'spec_helper'

describe User do
  context 'attributes' do
    it { should have_db_column(:player_id) }
  end
end
