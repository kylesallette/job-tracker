require 'rails_helper'

  describe "user sees update link for company" do
    describe "user clicks update" do
      it "redirects to update" do

      visit companies_path

      expect(page).to have_content("All Companies")
    end
  end
end
