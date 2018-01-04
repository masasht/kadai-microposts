class LikesController < ApplicationController
  def create
    like = Like.new(
      user_id: current_user.id,
      micropost_id: params[:format]
      )
    if like.save
      flash[:notice] = "いいねしました"
    else
      flash[:notice] = "いいねできませんでした"
    end  
    redirect_to root_url
  end
  def destroy
    like = Like.find_by(user_id: current_user.id,
      micropost_id: params[:id])
    if like.destroy
      flash[:notice] = "いいねを取り消しました"
    else
      flash[:notice] = "いいねを取り消し出来ませんでした"
    end  
    redirect_back(fallback_location: root_path)
  end
  
end
