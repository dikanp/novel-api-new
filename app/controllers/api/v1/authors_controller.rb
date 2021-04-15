module Api
  module V1
    class AuthorsController < ApplicationController
      
      rescue_from ActiveRecord::RecordNotFound, with: :notFound
      rescue_from ActiveRecord::RecordNotDestroyed, with: :notDestroyed
      
      def index
        @authors = Author.all
        render json: {
          values: @authors,
          message: "success",
        }, status: 200
      end

      def show
        @author = Author.find_by(id: params[:id])
        if @author.present?
          render json: {
            values: @author,
            message: "success"
          }, status: 200
        else
          render json: {
            values: "",
            message: "ID not found"
          }, status: 400
        end
      end

      def create
        @author = Author.new(author_params)
        if @author.save
          render json: {
            values: @author,
            message: "success"
          }, status: 201
        else
          render json: {
            values: "",
            message: @author.errors.full_messages
          }, status: 422
        end
      end

      def update
        @author = Author.find(params[:id])
        if @author.update(author_params)
          render json: {
            values: @author,
            message: "success"
          }, status: 200
        else
          render json: {
            values: "",
            message: @author.errors.full_messages
          }, status: 400
        end
      end

      def destroy
        @author = Author.find(params[:id])
        @author.destroy!
          render json: {
            values: @author,
            message: "success"
          }, status: 200
        # else
          # render json: {
          #   values: "",
          #   message: "Failed"
          # }, status: 400
        # end
        # rescue ActiveRecord::RecordNotDestroyed
          # render json: {
          #   values: "",
          #   message: "Failed"
          # }, status: 422
        # end
      end

      private 
      def author_params
        params.require(:author).permit(:name)
      end

      def notFound
        render json: {
          values: {},
          message: "Data not Found!",
        }, status: 400
      end

      def notDestroyed(e)
        render json: {
          values: "",
          message: e.record.errors
        }, status: 422
      end
    end
  end
end
