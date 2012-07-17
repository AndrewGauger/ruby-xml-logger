class DocumentsController < ApplicationController
	
	def index
		@documents = Document.all

		respond_to do |format|
			format.html
			format.xml { render xml: @documents}
		end
	end

	def new

	end

	def create
		@document = Document.new(:xmlDoc => request.body.read)
		render :xml => "<?xml version =\"1.0\"?>\n<response stat=\"ok\"/>"
	end

end