# frozen_string_literal: true

class DecidimInitiatives
  include Sidekiq::Worker

  def perform
    system("bundle exec rake decidim_initiatives:check_validating")
    system("bundle exec rake decidim_initiatives:check_published")
    system("bundle exec rake decidim_initiatives:notify_progress")
  end
end
