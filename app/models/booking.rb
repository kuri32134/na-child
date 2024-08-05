class Booking < ApplicationRecord
  
  belongs_to :event
  belongs_to :user
  has_many :booking_children, dependent: :destroy
  accepts_nested_attributes_for :booking_children
  
end
