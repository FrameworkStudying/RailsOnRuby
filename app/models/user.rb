class User < ApplicationRecord
    # the attr_accessor could add a pair of set/get method for the member variable(member field)
    # should use comma to separate the member variables
    attr_accessor :id, :username, :password, :isAdministrator

    def initialize(params)
        @id = params[:id]
        @username = params[:username]
        @password = params[:password]
        @isAdministrator = params[:isAdministrator]
    end

    def isAdmin?
        if @isAdmin == 1
            return true
        else
            return false
        end
    end

end
