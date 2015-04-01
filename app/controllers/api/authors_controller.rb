module Api
  class AuthorsController < Api::BaseController

    private

      def author_params
        params.require(:author).permit(:lname)
      end

      def query_params
        params.permit(:lname)
      end

  end
end