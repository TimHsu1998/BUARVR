class News < ApplicationRecord
  mount_uploader :image, ImageUploader
end
