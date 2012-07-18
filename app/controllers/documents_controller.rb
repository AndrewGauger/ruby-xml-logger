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
		if @document.save
			render :xml => "<?xml version =\"1.0\"?>\n<response stat=\"ok\"/>"
		else
			render :xml => "<?xml version =\"1.0\"?>\n<response stat=\"fail\" code = \"error\"/>"
		end
	end

end