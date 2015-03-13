feature "List of Pictures", :js => true  do
  scenario "displays appropriately the index page of the pictures with pagination" do
    factory_pictures = FactoryGirl.create_list(:picture, 21)
    factory_pictures.each { |p| p.stub_chain(:picture_file, :url).with(:thumb).and_return('http://www.jasminepalace.ie/posts/roundthumbnails/18/round_iStock_000003638041Medium.jpg')}
   

    visit '/pictures'
    expect(find('h1')).to have_content('List of Pictures')
    page.assert_selector('li.listed_picture', :count => 10)
    c = HTMLEntities.new
    click_on(c.decode(I18n.t("views.pagination.next")))
    page.assert_selector('li.listed_picture', :count => 10)
    click_on(c.decode(I18n.t("views.pagination.next")))
    page.assert_selector('li.listed_picture', :count => 1)
  end
end