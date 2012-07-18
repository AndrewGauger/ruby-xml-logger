require 'nokogiri'

class Document < ActiveRecord::Base
	attr_accessible :orderNumber, :xmlDoc


	validates :xmlDoc, :presence => true

	before_create :set_orderNumber

	def set_orderNumber
		@xml = Nokogiri::XML::Document.parse(self.xmlDoc.to_s)
		self.orderNumber = @xml.xpath("//Order//SalesHeader//SalesId").text
	end

end