Rails.application.routes.draw do
  mount Decidim::Core::Engine => '/'
  mount Decidim::Census::AdminEngine => '/admin/census'
  mount Decidim::DibaCensusApi::AdminEngine => '/admin/census'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  resource :system_status, only: :show
end
