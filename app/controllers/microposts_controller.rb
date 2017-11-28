class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save

    @client = Twitter::REST::Client.new do |config|
     config.consumer_key = "10hjuDQXQaJaisAln8DWql6Gh"
     config.consumer_secret = "KEoE66jm2BU9LRmYOKthuavntW2aD75AkA9L94WjNZfl2eoL5g"
     config.access_token = "822784561780137984-xUTX7Bg46xVcingkqi6jhGsFakftULH"
     config.access_token_secret = "3q25uHt2GrJGKiJqTbDz4RYeu5UAHHo9QI4mF3rTw8Ygm"
    end
    num = (params["micropost"]["content"]).length
#binding.pry
      # Twitter投稿
     if num <= 146 &&  1 <= num
       @client.update(params["micropost"]["content"])
     end

      flash[:success] = "投稿しました"
      redirect_to root_url
    else
      render 'static_pages/home', notice: '投稿に失敗しました'
    end

  end

  def destroy
    @micropost = current_user.microposts.find_by(id: params[:id])
    return redirect_to root_url if @micropost.nil?
    @micropost.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to request.referrer || root_url
  end

  private
  def micropost_params
    params.require(:micropost).permit(:content, :picture)
  end
end
