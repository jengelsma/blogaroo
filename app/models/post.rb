class Post < ActiveRecord::Base
	validates :title, :article, :presence=>true
	validates :likes, numericality: {greater_than_or_equal_to: 0}
	enum status: [:published, :unpublished]
end
