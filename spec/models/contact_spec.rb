require 'rails_helper'

RSpec.describe Contact, type: :model do
    it "has a valid factory" do
    	# the create approach will build the model and save it
        expect(create(:contact)).to be_valid
    end

    it "is invalid without a firstname" do
    	# the build approach will build the model and do not save it
        expect(build(:contact, firstname: nil)).to_not be_valid
    end

    it "is invalid without a lastname" do
        expect(build(:contact, firstname: nil)).to_not be_valid
    end
    
    it "return a contact's full name as a string" do
        contact = build(:contact, firstname: "Xiang", lastname: "Hou")
        expect(contact.name).to eq("Xiang Hou")
    end
end
