class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc })
    render({ :template => "photo_templates/list" })
  end

  def show
    url_id = params["path_id"]
    matching_relation = Photo.where({ :id => url_id })
    @photo = matching_relation.first
    render({ :template => "photo_templates/show" })
  end

  def destroy
    id = params["path_id"]
    matching_relation = Photo.where({ :id => id })
    matching_photo_instance = matching_relation.first
    matching_photo_instance.destroy
    redirect_to("/photos")
  end

  def create
    new_photo = Photo.new
    new_photo.image = params["input_image_url"]
    new_photo.caption = params["input_caption"]
    new_photo.owner_id = params["input_owner_id"]
    new_photo.save
    redirect_to("/photos/#{new_photo.id}")
  end

  def update
    id = params["path_id"]
    matching_relation = Photo.where({ :id => id})
    photo_details = matching_relation.first
    photo_details.image = params["input_image_url"]
    photo_details.caption = params["input_caption"]
    photo_details.save
    redirect_to("/photos/#{id}")
  end
end
