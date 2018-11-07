Rails.application.routes.draw do
  mount Decidim::Core::Engine => '/'
  mount Decidim::Census::AdminEngine => '/admin/census'
  mount Decidim::DibaCensusApi::AdminEngine => '/admin/census'

  if Rails.application.config.action_mailer.delivery_method == :letter_opener_web
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end

  resource :system_status, only: :show
end
