class FirstpostsController < ApplicationController


  def create
    @firstpost = Firstpost.new(params.require(:firstpost).permit(:content))
    if @firstpost.save
      flash[:success] = "投稿しました"
      redirect_to static_pages_home_d_path
    else
      render 'static_pages/home_d', notice: '投稿に失敗しました'
    end
  end

  private
  def firstpost_params
    params.require(:firstpost).permit(:content)
  end
end
