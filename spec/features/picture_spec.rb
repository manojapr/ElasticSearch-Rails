require 'spec_helper'


feature "Picture", :js => true  do

  scenario "displays appropriately the new picture page and form" do
    ApplicationController.any_instance.stub_chain(:picture_file, :url).with(:thumb).and_return('http://www.jasminepalace.ie/posts/roundthumbnails/18/round_iStock_000003638041Medium.jpg')
    visit '/'
    expect(find('h1')).to have_content('New Picture')
    new_picture = FactoryGirl.build(:picture)
    fill_in 'Title', :with => new_picture.title
    fill_in 'Description', :with => new_picture.description
    attach_file('Picture file', File.expand_path('./spec/resources/img_1.jpg'))
    expect { click_button 'Create Picture' }.to change(Picture, :count).by(+1)
  end
 

end


