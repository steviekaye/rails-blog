class Category < ApplicationRecord
    #has_and_belongs_to_many :article
    has_many :articles

end
