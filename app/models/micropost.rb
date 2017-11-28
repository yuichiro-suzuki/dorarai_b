class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  mount_uploader :picture, PictureUploader
  validates :content,  length: { maximum: 1000 }
  validate  :picture_size


 private

 def picture_size
   if picture.size > 5.megabytes
     errors.add(:picture, "容量が制限を超えています")
   end
 end
end
