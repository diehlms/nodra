class GalleryController < ApplicationController

    def new
        @gallery = Gallery.new
    end

    def index
        @gallery = Gallery.all
    end

    def show
        @gallery = Gallery.find(params[:id])
    end

    def create
        @gallery = Gallery.new
        if @gallery.save
            flash[:notice] = "Photo added"
            render 'index'
        else 
            render 'new'
        end
    end

    def destroy
        @gallery = Gallery.find(params[:id])
        if @gallery.destroy
            flash[:notice] = "Photo was deleted"
            redirect_to root_url
        else
            redirect_to 'index'
        end
    end

end
