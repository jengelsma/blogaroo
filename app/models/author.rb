class Author < ActiveRecord::Base
  validates :fname, :lname, :email, :presence => true
  validates :email, :uniqueness => true
  validates_format_of :email, :with => /@/
  validates :thumbnail, allow_blank: true, format: {with: %r{\.(gif|jpg|png)\Z}i,
				message: 'must be a URL for GIF, JPG or PNG image.'}

	has_many :posts
	
	def full_name
		"#{self.fname} #{self.lname}"
	end
end
