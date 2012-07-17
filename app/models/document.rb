class Document < ActiveRecord::Base
	attr_accessible :orderNumber, :xmlDoc, :created

	validates :xmlDoc, :presence => true
end