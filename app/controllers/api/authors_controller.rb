module Api
  class AuthorsController < Api::ApiBaseController

  	def index
  		authors = Author.all
  		render json: { authors: authors }, status: :ok
  	end

  	def create
  		author = Author.new(author_params)
  		
      if author.save
        api_response = { message: "Author was created successfully!" }
        render json: api_response, status: :created
      else
        api_response = { message: "Request didn't process successfully!", errors: author.errors }
        render json: api_response, status: :unprocessable_entity
	     end
  	end

  	def update
  		author = Author.find_by(email: author_params[:email])
  		if author.nil?
  			api_response = { message: "Can't find an author with provided email address!" }
      		render json: api_response, status: :unprocessable_entity
  		elsif author.update(author_params)
    		api_response = { message: "Author was updated successfully!" }
      		render json: api_response, status: :unprocessable_entity
  		else
    		api_response = { message: "Request didn't process successfully!", errors: author.errors }
			render json: api_response, status: :unprocessable_entity
  		end

  	end

  	def destroy
  		author = Author.find_by(email: author_params[:email])
  		if author.nil?
  			api_response = { message: "Can't find an author with provided email address!" }
      		render json: api_response, status: :unprocessable_entity
  		else 
  			author.destroy
  			api_response = { message: "Author was deleted successfully!" }
      		render json: api_response, status: :ok

  		end
  	end

  	private
  	def author_params
		params.require(:author).permit(:fname, :lname, :email, :thumbnail)
    end
  end
end