class App < ActiveRecord::Base
	has_many :messages
	attr_accessible :app_title, :description

	validates_presence_of :app_title, :description
	validates :app_title, :length => {
		:maximum => 60,
		:too_long => "60 is the maximum number of characters for this field."
	}
	validates :description, :length => {
		:maximum => 160,
		:too_long => "160 is the maximum number of characters for this field."
	}

	before_save :set_default_active
	def set_default_active
  		self.active ||= true
	end
end
