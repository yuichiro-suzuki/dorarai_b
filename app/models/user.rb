class User < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  #認証機能
  mount_uploader :image, ImageUploader
  has_secure_password
  has_many :microposts

  private

  # アップロード画像のサイズを検証する
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
