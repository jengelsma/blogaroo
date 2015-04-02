module Api
  class PostsController < Api::ApiBaseController

  	def index
  		posts = Post.all
  		render json: { posts: posts }, status: :ok
  	end

  	def create
      post = Post.new(post_params)
      author = Author.find_by(email: post_params[:author_id])
      post.build_author(:id => author.id)

    	if post.save
      	api_response = { message: "Post was created successfully!" }
      	render json: api_response, status: :created
		  else
        api_response = { message: "Request didn't process successfully!", errors: post.errors }
        render json: api_response, status: :unprocessable_entity
	    end
  	end

    def post_params
      params.require(:post).permit(:title, :article, :status, :author_id, :likes)
    end
  end
end
