class Attachment < ActiveRecord::Base
  belongs_to :article
  mount_uploader :file, FileUploader
end
