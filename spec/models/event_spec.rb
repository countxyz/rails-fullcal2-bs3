require 'spec_helper'

describe Event do

  describe 'presence' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:start) }
    it { should validate_presence_of(:finish) }
  end

  describe 'field lengths' do
    it { should ensure_length_of(:name).is_at_least(2).is_at_most(100) }
    it { should ensure_length_of(:description).is_at_least(2).is_at_most(1000) }
  end

  describe 'invalid dates' do
    it 'cannot have a finish before start' do
      event = build(:event, start:  '2014-05-05 01:00:00', 
                            finish: '2014-05-04 01:00:00')
      expect(event).to_not be_valid
    end
  end
end