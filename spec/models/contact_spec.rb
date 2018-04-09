require 'rails_helper'

RSpec.describe Contact, type: :model do
	it "has a valid factory" do
		expect(create(:contact)).to be_valid
	end
	it "is invalid without a firstname"
	it "is invalid without a lastname"
	it "return a contact's full name as a string"
end
