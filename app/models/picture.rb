class Picture
  include DataMapper::Resource
  include DataMapper::Validate
  include Paperclip::Resource
  

  property :id, Serial
  property :title, String
  property :description, String

 has_attached_file :picture_file,
                   :styles => { :large => "1056x408#",
                                :thumb => "333x150#"}
  validates_attachment_presence :picture_file

  has n, :comments


end