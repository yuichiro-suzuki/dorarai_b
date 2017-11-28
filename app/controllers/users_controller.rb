class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update ]
  before_action :collect_user, only: [:edit, :update]

  def show
   @user = User.find(params[:id])
   @microposts = @user.microposts.order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "登録ありがとうございます!ログインをお願いします"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    #プロ画像更新
    file = params[:user][:image]
    if !file.nil?
      file_name = file.original_filename
      File.open("public/uploads/user/image/#{file_name}", 'wb'){|f| f.write(file.read)}
      @user.image = file_name
    end
    if @user.update(user_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to @user , notice: 'プロフィールを更新しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
private

  def user_params
    params.require(:user).permit(:name, :password,
                               :password_confirmation, :image)
  end

  def collect_user
    user = User.find(params[:id])
    if user != current_user
      redirect_to root_url  , notice:"認証に失敗しました"
    end
  end

end
