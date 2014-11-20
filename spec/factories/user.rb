require 'faker'
FactoryGirl.define do 
  factory :user do |f|
    f.f_name "Jonathan"
    f.l_name "Lake"
    f.email "jonlake5@gmail.com"
    f.address "5881 Dewpointe Dr"
    f.city "Allendale"
    f.state "Michigan"
    f.zip "49401"
    f.password "password1"
    f.password_confirmation "password1"
  end
end
