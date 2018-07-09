class Dtr < ApplicationRecord
	validates :gName, :lName, :wAssigned, :presence => true
	validates_format_of :gName, :with => /\A[a-zA-Z]+\Z/
	validates_format_of :lName, :with=> /\A[a-zA-Z]+\Z/
	validates_format_of :wAssigned, :with=> /\A[a-zA-Z]+\Z/
end
