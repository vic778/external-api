require 'dotenv'
require 'json'
Dotenv.load

class CuisinesController < ApplicationController 
   skip_before_action :verify_authenticity_token

   @@URL = "https://jummia.herokuapp.com/api/categories"

   def index
      @response =  RestClient.get @@URL,
         {content_type: :json, accept: :json, "user-key": ENV["API_KEY"]}
         @response = JSON.parse(@response)
      if @response
         render json: @response
      else
         render json: {message: "City Not Found", error: 404}
      end
  end

   def show
      @response =  RestClient.get "https://jummia.herokuapp.com/api/categories/#{params[:id]}",
         {content_type: :json, accept: :json, "user-key": ENV["API_KEY"]}
         @response = JSON.parse(@response)

      if @response

         render json: @response
      else
         render json: {message: "City Not Found", error: 404}
      end
  end

   def create
      @response =  RestClient.post @@URL,
         {content_type: :json, accept: :json, "user-key": ENV["API_KEY"]}   
         @response = JSON.parse(@response)  
      if @response
         render json: @response
      else
         render json: {message: "City Not Found", error: 404}
      end
  end

end 