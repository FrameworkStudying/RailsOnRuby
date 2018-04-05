require 'rails_helper'

RSpec.describe User, type: :model do
    # the let will instance value about the result of the block
    # the variable is a memozied value and will memorized in cache after let code be called firstly
    let(:user) { User.new(params) }

    # `let` is not available from within an example (e.g. an `it` block) 
    # or from constructs that run in the scope of an example (e.g. `before`, `let`, etc). 
    # It is only available on an example group (e.g. a `describe` or `context` block).
    let(:params) { { id: @id, username: @username, password: @password, isAdministrator: @isAdministrator} }

    context "test for isAdmin? method" do
        # define the test terget object, you could use [subject] to load the object in example
        subject{ user.isAdmin? }

        it "a normal user" do
            # you could use [@variavle_name] to set value to [@variavle_name] of [let] setting
            @id = '1'
            @username = 'core'
            @password = '111111'
            @isAdministrator = 0

            # is_expected is defined simply as expect(subject) 
            # and is designed for when you are using rspec-expectations with its newer expect-based syntax.
            # in this situation, [is_expected] equals [ expect(user.isAdmin?) ]
            is_expected.to eq(false)
        end

        it "a administrator user" do
            @id = '2'
            @username = 'admin'
            @password = '111111'
            @isAdministrator = 1

            is_expected.to eq(true)
        end
    end

    context "validation for id property" do
        subject{ user.valid? }

        it "length : the size is longer than 32 (33)" do
            @id = '123456789123456789123456789123456'
            @username = 'core'
            @password = '111111'
            @isAdministrator = 0

            # in this situation, [is_expected] equals [ expect(user.valid?) ]
            is_expected.to eq(false)
        end

        it "length : the size is shorter than 32 (31)" do
            @id = '1234567891234567891234567891234'
            @username = 'core'
            @password = '111111'
            @isAdministrator = 0

            is_expected.to eq(false)
        end

        it "length : the size is same to 32" do
            @id = '12345678912345678912345678912345'
            @username = 'core'
            @password = '111111'
            @isAdministrator = 0

            is_expected.to eq(true)
        end

        it "length : the id property is blank" do
            @id = ''
            @username = 'core'
            @password = '111111'
            @isAdministrator = 0

            is_expected.to eq(false)
        end

        it "length : the id property is nil" do
            @id = nil
            @username = 'core'
            @password = '111111'
            @isAdministrator = 0

            is_expected.to eq(false)
        end
    end
end
