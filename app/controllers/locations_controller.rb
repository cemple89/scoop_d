require 'pry'
# frozen_string_literal: true
class LocationsController < ApplicationController

  def index
    @locations = Location.all.order('name DESC')
    if params[:search]
      @results = Location.search(params[:search]).order('name DESC')
    else
      @locations = Location.all.order('name DESC')
    end
  end

  def new
    @location = Location.new
    @neighborhood_collection = Location::NEIGHBORHOODS
  end

  def create
    @neighborhood_collection = Location::NEIGHBORHOODS
    @location = Location.new(location_params)
    @location.user = current_user
    if @location.save
      redirect_to location_path(@location)
      flash[:notice] = "Location added successfully"
    else
      flash[:notice] = @location.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @location = Location.find(params[:id])
    @address = JSON.parse(@location.address)
    @neighborhoods = ""
    if @location.neighborhood != nil
      @neighborhoods = JSON.parse(@location.neighborhood)
      @neighborhoods = @neighborhoods.join(", ")
    end
    @address = @address.join(", ")
    @reviews = @location.reviews
    @reviews.each do |review|
      sum = 0
      votes = []
      votes = Vote.where(review_id: review.id)
      votes.each do |vote|
        sum += vote.count
      end
      review.update_attribute(:total, sum)
    end
    @reviews = @location.reviews.order(total: :desc)
  end

 private

 def location_params
   params.require(:location).permit(:name, :address, :city, :state, :zip_code, :neighborhood, :phone_number, :url, :user)
 end

end
