class PostComment < ApplicationRecord
  
  belongs_to :user
  belongs_to :leader
  belongs_to :post
  
end
