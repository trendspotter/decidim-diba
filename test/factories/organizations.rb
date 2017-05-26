FactoryGirl.define do
  factory :organization, class: Decidim::Organization do
    name { Faker::Company.unique.name }
    reference_prefix { Faker::Name.suffix }
    twitter_handler { Faker::Hipster.word }
    facebook_handler { Faker::Hipster.word }
    instagram_handler { Faker::Hipster.word }
    youtube_handler { Faker::Hipster.word }
    github_handler { Faker::Hipster.word }
    sequence(:host) { |n| "#{n}.lvh.me" }
    description { Decidim::Faker::Localized.wrapped('<p>', '</p>') { Decidim::Faker::Localized.sentence(2) } }
    welcome_text { Decidim::Faker::Localized.wrapped('<p>', '</p>') { Decidim::Faker::Localized.sentence(2) } }
    homepage_image { test_file('city.jpeg', 'image/jpeg') }
    favicon { test_file('icon.png', 'image/png') }
    default_locale { I18n.default_locale }
    available_locales { Decidim.available_locales }
    official_img_header { test_file('avatar.jpg', 'image/jpeg') }
    official_img_footer { test_file('avatar.jpg', 'image/jpeg') }
    official_url { Faker::Internet.url }
  end
end

def test_file(filename, content_type)
  asset = Decidim::Dev.asset(filename)
  Rack::Test::UploadedFile.new(asset, content_type)
end
