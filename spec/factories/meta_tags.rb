# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :meta_tag do
    site { "MyString" }
    title { "MyString" }
    keywords { "MyText" }
    description { "MyText" }
    noindex { false }
    nofollow { false }
    canonical { "MyString" }
    prefix { "MyString" }
    separator { "MyString" }
    suffix { "MyString" }
    prev { "MyString" }
  end
end
