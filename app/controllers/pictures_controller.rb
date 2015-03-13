class PicturesController < ApplicationController
  before_filter :get_picture, only: :show

  def new
    @picture = Picture.new
  end


  def create
    @picture = Picture.new(params[:picture])
    if @picture.save
      redirect_to pictures_path
    else
      render :new
    end
  end


  # def edit
  # end


  # def update
  #   @picture.update(params[:picture])
  #   redirect_to edit_picture_path(@picture)
  # end

  def index
    @pictures = Picture.all.page(params[:page]).per(6)
  end


  def show
    @comment = Comment.new
    @picture.comments << @comment
  end


  def destroy
    @picture.destroy
    redirect_to action: :index
  end

  private

  def get_picture
    @picture = Picture.get(params[:id])
  end

end
