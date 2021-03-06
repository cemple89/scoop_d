# frozen_string_literal: true
class LocationsController < ApplicationController

  def index
    @locations = Location.all.order('name ASC')
    if params[:search]
      @results = Location.search(params[:search]).order('name ASC')
    else
      @locations = Location.all.order('name ASC')
    end
    respond_to do |format|
      format.html
      format.json { render json: @locations }
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

    if @location.address == nil
      @address = ""
    elsif @location.address[0] == "["
      @address = JSON.parse(@location.address)
      @address = @address.join(", ")
    else
      @address = @location.address
    end

    if @location.neighborhood == nil
      @neighborhood = ""
    elsif @location.neighborhood[0] == "["
      @neighborhoods = JSON.parse(@location.neighborhood)
      @neighborhoods = @neighborhoods.join(", ")
    else
      @neighborhood = @location.neighborhood
    end
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

  def destroy
    if current_user.admin?
      @location = Location.find(params[:id])
      @location.destroy
      flash[:notice] = 'Location was successfully deleted'
      redirect_to users_path
    end
  end

 private

 def location_params
   params.require(:location).permit(:name, :address, :city, :state, :zip_code, :neighborhood, :phone_number, :url, :user)
 end

end
