require 'rails_helper'

RSpec.describe User, type: :model do
    it "isAdmin? : a normal user" do
        params = {
            id: 1,
            username: 'core',
            password: '111111',
            isAdministrator: 0
        }
        user = User.new(params)
        expect(user.isAdmin?).to eq(false)
    end

    it "isAdmin? : a administrator user" do
        params = {
        	id: 2,
        	username: 'admin',
        	password: '111111',
        	isAdministrator: 1
        }
        user = User.new(params)
        expect(user.isAdmin?).to eq(true)
    end
end
