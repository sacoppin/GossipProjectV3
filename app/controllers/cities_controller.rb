  class CitiesController < ApplicationController
    
    def show

      puts params[:id]
  
      @city = City.find(params[:id])
      @gossips = []
     
    end
  
  end