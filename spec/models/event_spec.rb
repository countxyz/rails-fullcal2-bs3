require 'spec_helper'

describe Event do

  describe 'empty fields' do
    it 'is invalid when name is not provided' do
      expect(build(:event, name: nil)).to_not be_valid
    end

    it 'is invalid when description is not provided' do
      expect(build(:event, description: nil)).to_not be_valid
    end
  end

  describe 'field lengths' do
    it 'is invalid when name has fewer than 2 characters' do
      expect(build(:event, name: 'a')).to_not be_valid
    end

    it 'is invalid when name has more than 100 characters' do
      expect(build(:event, name: 'a' * 101)).to_not be_valid
    end

    it 'is invalid when description has fewer than 2 characters' do
      expect(build(:event, description: 'a')).to_not be_valid
    end

    it 'is invalid when description has more than 1000 characters' do
      expect(build(:event, description: 'a' * 1001)).to_not be_valid
    end
  end

  describe 'invalid dates' do
    it 'cannot have a finish before start' do
      event = build(:event, start: '2014-01-24 01:00:00', 
                            finish: '2014-01-23 01:00:00')
      expect(event).to_not be_valid
    end
  end
end