class EmailTemplate < ApplicationRecord
  extend Enumerize
  mount_uploader :attachment_file, ImageUploader

  validates :name, :body, :template_type, presence: true

  scope :active, -> { where(status: true) }

  enumerize :template_type, in: %i[payment_finish], scope: :type
end