class PlacesController < ApplicationController

  def index
    # find all Place rows
    @places = Place.all
    # render places/index view
  end

  def show
    # find a Place
    @place = Place.find_by({"id" => params["id"]})
    @posts = Post.where({"place_id" => @place["id"]})
    # render places/show view with details about Place
    # render :template => "places/show"
  end

  def new
    @place = Place.new
    # render view with new Place form
  end
  
  def create
    # start with a new Place
    @place = Place.new

    puts params["place"]

    # assign user-entered form data to Place's columns
    @place["name"] = params["place"]["name"]
    @place["created_at"] = params["place"]["created_at"]
    @place["updated_at"] = params["place"]["updated_at"]

    # save Place row
    @place.save

    # redirect user
    redirect_to "/places"
  end

end
