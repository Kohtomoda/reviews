class Movie < ActiveRecord::Base
    has_many :comments
    belongs_to :user
    
    validates :user_id, presence:true
    validates :title, presence: true
    validates :story, presence: true, length: { maximum: 500 }
    
    mount_uploader :image, ImageUploader
end
