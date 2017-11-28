class FreepostsController < ApplicationController


  def create
    @freepost = Freepost.new(params.require(:freepost).permit(:content))
    if @freepost.save
      flash[:success] = "投稿しました"
      redirect_to static_pages_home_c_path
    else
      render 'static_pages/home_c', notice: '投稿に失敗しました'
    end
  end

  private
  def freepost_params
    params.require(:freepost).permit(:content)
  end
end
