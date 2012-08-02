class DocumentsController < ApplicationController
	
	def index
		@documents = Document.all

		respond_to do |format|
			format.html		#app/view/documents/index.html.erb
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
			render :xml => "<?xml version =\"1.0\"?>\n<response stat=\"ok\" code = \"exists\"/>"
		end
	end

	def show
		@document = Document.find(params[:id])

		respond_to do |format|
			format.html		#app/views/documents/show.html.erb
			format.xml { render xml: @document }
		end
	end

	def download
		@document = Document.find(params[:id])
		send_data( @document.xmlDoc.to_s, :type => "text/xml", :filename => @document.orderNumber.to_s + ".xml")
	end


end