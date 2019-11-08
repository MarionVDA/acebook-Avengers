class PhotosController < ApplicationController
 before_action :set_photo, only: [:show, :edit, :update, :destroy]
 # GET /photos
 # GET /photos.json
 def index
   @album = Album.find(params[:album_id])
 end
 # GET /photos/1
 # GET /photos/1.json
 def show
   @album = Album.find(params[:album_id])
 end
 # GET /photos/new
 def new
   @album = Album.find(params[:album_id])
   # @image = @album.images.new
 end
 # GET /photos/1/edit
 def edit
   @album = Album.find(params[:album_id])
   @photo = Photo.find(params[:id])
 end
 # POST /photos
 # POST /photos.json
 def create
   @album = Album.find(params[:album_id])
   if @album.user_id == current_user.id
     @photo = @album.photos.create(params[:photo].permit(:caption, :image, :user_id, :photo_id))
     flash[:notice] = 'Photo was successfully created.'
   else
     flash[:notice] = 'You are not the owner of this album'
   end
   redirect_to @album
 end
 # PATCH/PUT /photos/1
 # PATCH/PUT /photos/1.json
 def update
   @album = Album.find(params[:album_id])
   @photo = Photo.find(params[:id])
   if @photo.user_id == current_user.id
     @photo.update(photo_params)
     flash[:notice] = 'Photo was successfully edited.'
   else
     flash[:notice] = 'You are not the owner of this photo'
   end
   redirect_to album_path(@album)
 end
 # DELETE /photos/1
 # DELETE /photos/1.json
 def destroy
   @album = Album.find(params[:album_id])
   @photo = @album.photos.find(params[:id])
   if @photo.user_id == current_user.id
     @photo.destroy
     flash[:notice] = 'Photo was successfully deleted.'
     redirect_to album_path(@album)
   else
     flash[:notice] = 'You are not the owner of this photo'
     redirect_to album_path(@album)
   end
 end
 private
   # Use callbacks to share common setup or constraints between actions.
   def set_photo
     @photo = Photo.find(params[:id])
   end
   # Never trust parameters from the scary internet, only allow the white list through.
   def photo_params
     params.require(:photo).permit(:caption, :image, :user_id, :photo_id)
   end
end
