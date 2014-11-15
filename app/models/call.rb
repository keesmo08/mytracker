class Call < ActiveRecord::Base

	belongs_to :user
	#scope :calls, lambda { |date = Date.today| where(date: (date)) }
	scope :activeAtDate, lambda { |date = Date.today| where('date >= ?', date) }

end
