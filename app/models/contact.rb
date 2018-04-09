class Contact < ApplicationRecord
    attr_accessor :firstname, :lastname
    validates :firstname, :lastname, presence: true

    def name
    	[firstname, lastname].join " "
    end
end
