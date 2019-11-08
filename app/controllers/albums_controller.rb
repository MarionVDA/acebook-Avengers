# frozen_string_literal: true

class AlbumsController < ApplicationController
  before_action :set_album, only: %i[show edit update destroy]
  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.all
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    @album = Album.find(params[:id])
  end

  # GET /albums/new
  def new
    @album = Album.new
  end

  # GET /albums/1/edit
  def edit
    @album = Album.find(params[:id])
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.create(album_params)
    redirect_to albums_url, notice: 'Album was successfully created.'
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    @album = Album.find(params[:id])
    if @album.user_id == current_user.id
      @album.update(album_params)
      flash[:notice] = 'Album was successfully edited.'
      redirect_to albums_url
    else
      flash[:notice] = 'You are not the owner of this album'
      redirect_to albums_url
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    if @album.user_id == current_user.id
      @album.destroy
      flash[:notice] = 'Album was successfully deleted.'
    else
      flash[:notice] = 'You are not the owner of this album'
    end
    redirect_to albums_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_album
    @album = Album.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def album_params
    params.require(:album).permit(:name, :user_id)
  end
end
