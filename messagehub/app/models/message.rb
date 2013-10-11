class Message < ActiveRecord::Base
	belongs_to :app
	attr_accessible :username, :app_id, :content

	validates_presence_of :username, :app_id, :content
	validates_format_of :username, :with => /^[A-Za-z0-9_\-.&]*\z/, :multiline => true
	validates :content, :length => {
		:maximum => 160,
		:too_long => "160 is the maximum number of characters for this field."
	}
	validates :username, :length => {
		:minimum => 3,
		:maximum => 60,
		:too_long => "This field must contain between 3 and 60 characters."
	}

	before_save :set_default_active
	def set_default_active
  		self.active ||= true
	end
end
