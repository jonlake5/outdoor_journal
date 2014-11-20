require 'spec_helper'

describe User do

  it "has a valid factory" do
    FactoryGirl.create(:user).should  be_valid
  end
    
  it "is invalid without a first name" do
    FactoryGirl.build(:user, f_name: nil).should_not be_valid
  end
  
  it "is invalid without a last name" do
    FactoryGirl.build(:user, l_name: nil).should_not be_valid
  end
  
  it "is invalid without an email" do
    FactoryGirl.build(:user, email: nil).should_not be_valid
  end
end

