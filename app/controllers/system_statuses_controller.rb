class SystemStatusesController < ApplicationController

  def show
    Decidim::Organization.count
    render plain: 'ok'
  end

end
