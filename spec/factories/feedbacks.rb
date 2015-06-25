FactoryGirl.define do

  factory :feedback do
    name "Ivan Petrov"
	sequence(:email) {|n| "user#{n}@expamle.com"}
	message "MyText"
	file "./uploads/img.jpg"
	bypass_humanizer true
  end

  factory :invalid_feedback, class: "Feedback" do
    name nil
	sequence(:email) {|n| "user#{n}"}
	message "MyText"
	file "./uploads/img.jpg"
  end


end
