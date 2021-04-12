require "rails_helper"

RSpec.describe "Overrides" do
  scenario "remove override to allow non signed in users to be invited to the promoter committee" do
    # remove app/permissions/decidim/initiatives/permissions.rb, see docs/overrides.md for details
    expect(Decidim.version).to be < "0.22"
  end

  scenario "remove override export proposals to csv in all locales" do
    # remove config/initializers/csv_exporter.rb if PR https://github.com/decidim/decidim/pull/7825 is backported to 0.24
    # otherwise remove the override after upgrading to 0.25
    expect(Decidim.version).to be < "0.24"
  end
end
