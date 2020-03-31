class CitiesController < ApplicationController
  def show
    @city = City.new
  end
end
