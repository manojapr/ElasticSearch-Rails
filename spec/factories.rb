FactoryGirl.define do
  factory :picture do
    title "My Picasso"
    description "It's like looking in a mirror."
    picture_file_file_name { 'spec/resources/img_1.jpg' }
    picture_file_content_type { 'image/jpg' }
    picture_file_file_size { 1024 }
  end


end