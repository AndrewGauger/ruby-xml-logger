require 'nokogiri'

class Document < ActiveRecord::Base
	attr_accessible :orderNumber, :xmlDoc
	validates :xmlDoc, :presence => true
	before_create :set_orderNumber

	def set_orderNumber
		@xml = Nokogiri::XML::Document.parse(self.xmlDoc.to_s)
		self.orderNumber = @xml.xpath("//Order//SalesHeader//SalesId").text

		#Only allow a single transaction per order Number
		if Document.where(:orderNumber => self.orderNumber).count > 0
			return false
		end
		
		#check for count of rows, Heroku added hard row limit
		if Document.count > 13500
			#handles log rotation, Implemented once Heroku hit 4M
			@oldest_document = Document.first(:order => 'id asc')
			@oldest_document.destroy
		end

	end

end