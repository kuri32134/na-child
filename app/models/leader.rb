class Leader < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :event, dependent: :destroy
  has_one_attached :image


  def self.looks(search, word)
    if search == "perfect_match"
      @leader = Leader.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @leader = Leader.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @leader = Leaedr.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @leader = Leader.where("name LIKE?","%#{word}%")
    else
      @leader = Leader.all
    end
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

end
