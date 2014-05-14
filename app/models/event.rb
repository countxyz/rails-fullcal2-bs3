class Event < ActiveRecord::Base
  validate :finish_cannot_be_earlier_than_start
  
  validates :name, presence: true, length: { in: 2..100 }

  validates :description, presence: true, length: { in: 2..1000 }

  validates :start, presence: true

  validates :finish, presence: true

  private

    def finish_cannot_be_earlier_than_start
      unless start.nil? || finish.nil?
        time_error if finish < start
      end
    end

    def time_error
      errors.add(:time_error, 'The fundamental laws of nature prevent time travel')
    end
end
