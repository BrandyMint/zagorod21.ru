FactoryGirl.define do
  sequence(:slug) {|n| "slug#{n}"}

  factory :city do
    title
    slug
  end
end
