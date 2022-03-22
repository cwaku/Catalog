require_relative '../modules/game'
require 'date'

describe Game do
  context 'Testing Game class' do
    game = Game.new 'multiplayer', '2022-03-22', '1998-12-1'

    it 'Should be an instance of Game' do
      expect(game).to be_instance_of Game
    end

    it 'Should have a correct multiplayer value' do
      expect(game.multiplayer).to eq 'multiplayer'
    end

    it 'Should have a correct year' do
      expect(game.last_played_at.year).to eq 2022
    end

    it 'Should have a correct month' do
      expect(game.last_played_at.month).to eq 3
    end

    it 'Should have a correct day' do
      expect(game.last_played_at.day).to eq 22
    end
  end
end
