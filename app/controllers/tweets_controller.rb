# app/controllers/tweets_controller.rb
class TweetsController < ApplicationController
  # 投稿一覧と投稿フォームをログインなしでも見たいなら次のようにし、
  # 投稿を作る（create）はログイン必須にします：
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @tweets = Tweet.includes(:user).order(created_at: :desc)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    tweet = Tweet.new(tweet_params)

    tweet.user_id = current_user.id  #追記

    if tweet.save
      redirect_to action: "index"
    else
      redirect_to action: "new"
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments
    @comment = Comment.new
  end

  private

  def tweet_params
    # 投稿可能なパラメータを許可（strong parameters）
    params.require(:tweet).permit(:title, :limit, :about)
  end
end