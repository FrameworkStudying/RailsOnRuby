require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
    describe "GET index" do
        context "when render index page" do
            it "has a 200 status code" do
                get :index
                expect(response.status).to eq(200)
            end
        end
    end
end
