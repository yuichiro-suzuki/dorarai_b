class StaticPagesController < ApplicationController

  def home_b
    @micropost = current_user.microposts.build if logged_in?
  end

  def home_c
    @freepost = Freepost.new
    @freeposts = Freepost.all.order(created_at: :desc)
  end

  def home_d
    @firstpost = Firstpost.new
    @firstposts = Firstpost.all.order(created_at: :desc)
  end

  def home
     @microposts = Micropost.page(params[:page]).order(created_at: :desc)
  end
end
