class PicturesController < ApplicationController

    helper_method :current_user, :logged_in?

    def index
      @pictures = Picture.all
    end
   
    def new
      @picture = Picture.new
    end
   
    def create
      @picture = Picture.new(picture_params)
      if @picture.save
        redirect_to pictures_path
      else
        render :new
      end
    end
   
    def destroy
      @picture = Picture.find(params[:id])
      if @picture.destroy
          redirect_to root_url, notice: "Picture was deleted"
      else
          redirect_to pictures_path
      end
    end

    private
   
    def picture_params
      params.require(:picture).permit(:title, :body, :image)
    end

end