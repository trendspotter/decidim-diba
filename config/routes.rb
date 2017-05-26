Rails.application.routes.draw do
  mount Decidim::Core::Engine => '/'

  resource :system_status, only: :show
end
