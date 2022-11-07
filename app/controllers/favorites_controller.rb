class FavoritesController < ApplicationController

  # 投稿画像(post_image)にいいねを付ける
  def create
    post_image = PostImage.find(params[:post_image_id])
    # ログイン中のユーザーに空のオブジェクトを作成し、post_imageのidをfavoritesテーブルのpost_image_idに紐づける
    favorite = current_user.favorites.new(post_image_id: post_image.id)
    favorite.save
    # showに遷移するにはidが必要なので引数を付ける
    redirect_to post_image_path(post_image)
  end

  def destroy
    post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.find_by(post_image_id: post_image.id)
    favorite.destroy
    redirect_to post_image_path(post_image)
  end
end
