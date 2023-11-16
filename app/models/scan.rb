class Scan < ApplicationRecord
    has_one_attached :uploaded_image
    has_rich_text :scan_content

    validates :title, presence: true
    validates :language, presence: true

end
