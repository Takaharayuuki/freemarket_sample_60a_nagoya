class Image < ApplicationRecord
  belongs_to :item
  mount_uploaders :images, ImageUploader
end