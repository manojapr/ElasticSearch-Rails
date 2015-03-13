require 'spec_helper'

describe Picture do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:picture)).to be_valid
  end

  it 'has an attached file' do
    expect(FactoryGirl.build(:picture, picture_file: nil)).to_not be_valid
  end

end
