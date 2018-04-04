require 'rails_helper'

RSpec.describe User, type: :model do
    context "test for isAdmin? method" do
        it "a normal user" do
            params = {
                id: '1',
                username: 'core',
                password: '111111',
                isAdministrator: 0
            }
            user = User.new(params)
            expect(user.isAdmin?).to eq(false)
        end

        it "a administrator user" do
            params = {
                id: '2',
                username: 'admin',
                password: '111111',
                isAdministrator: 1
            }
            user = User.new(params)
            expect(user.isAdmin?).to eq(true)
        end
    end

    context "validation for id property" do
        it "length : the size is longer than 32 (33)" do
            params = {
                id: '123456789123456789123456789123456',
                username: 'username',
                password: '111111',
                isAdministrator: 0
            }

            user = User.new(params)
            expect(user.valid?).to eq(false)
        end

        it "length : the size is shorter than 32 (31)" do
            params = {
                id: '1234567891234567891234567891234',
                username: 'username',
                password: '111111',
                isAdministrator: 0
            }

            user = User.new(params)
            expect(user.valid?).to eq(false)
        end

        it "length : the size is same to 32" do
            params = {
                id: '12345678912345678912345678912345',
                username: 'username',
                password: '111111',
                isAdministrator: 0
            }

            user = User.new(params)
            expect(user.valid?).to eq(true)
        end

        it "length : the id property is blank" do
            params = {
                id: '',
                username: 'username',
                password: '111111',
                isAdministrator: 0
            }

            user = User.new(params)
            expect(user.valid?).to eq(false)
        end
        
        it "length : the id property is nil" do
            params = {
                id: nil,
                username: 'username',
                password: '111111',
                isAdministrator: 0
            }

            user = User.new(params)
            expect(user.valid?).to eq(false)
        end
    end
end
