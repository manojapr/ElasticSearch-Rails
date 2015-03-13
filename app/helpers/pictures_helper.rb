module PicturesHelper
  def show_title(picture)
    picture.title ||= 'No Title'
  end

  def show_description(picture)
    picture.description ||= 'No Description'
  end

end
