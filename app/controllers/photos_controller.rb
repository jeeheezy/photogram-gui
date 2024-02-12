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
end
