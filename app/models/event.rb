class Event < ApplicationRecord
  
  belongs_to :leader
  has_many :booking
  
end
