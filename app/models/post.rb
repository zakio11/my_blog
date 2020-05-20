class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, :content, presence: true, unless: :image?

  mount_uploader :image, ImageUploader


  def self.search(search)
    return Post.all unless search
    Post.where('title LIKE(?)', "%#{search}%")
  end

end
