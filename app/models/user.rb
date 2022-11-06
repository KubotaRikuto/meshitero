class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 1:Nの関係の「1」のデータが削除されたとき、関連する「N」のデータも削除する
  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  # "profile_image"という名前でActiveStorageに保存
  has_one_attached :profile_image

  # viewで画像サイズの指定する
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

end
