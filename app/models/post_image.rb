class PostImage < ApplicationRecord

  has_one_attached :image
  # userモデルを参照(1:NのN側)
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # バリデーション設定 shop_nameとimageの確認
  validates :shop_name, presence: true
  validates :image, presence: true

  def get_image
    # unless文はif文の反対で結果がfalseの場合処理される
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  # 引数(user)で渡されたユーザIDがFavoritesテーブルに存在するか調べるメソッド
  def favorited_by?(user)
    # favoritesテーブル内にuser_idが存在するか？
    favorites.exists?(user_id: user.id)
  end

end
