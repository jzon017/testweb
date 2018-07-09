class User < ApplicationRecord
	has_secure_password
	validates :gName, :lName, :presence => true
	validates_format_of :gName, :with => /\A[a-zA-Z]+\Z/
	validates_format_of :lName, :with=> /\A[a-zA-Z]+\Z/
end
