class Contact < ApplicationRecord
    attr_accessor :firstname, :lastname
    validates :firstname, :lastname, presence: true
end
