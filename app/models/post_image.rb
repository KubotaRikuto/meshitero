class PostImage < ApplicationRecord

  has_one_attached :image
  # userモデルを参照(1:NのN側)
  belongs_to :user
  has_many :post_comments, dependent: :destroy

  def get_image
    # unless文はif文の反対で結果がfalseの場合処理される
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end
