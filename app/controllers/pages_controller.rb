class PagesController < ApplicationController
  def home
    if params[:q].present?
      @results = Tweet.where("title LIKE :q OR about LIKE :q", q: "%#{params[:q]}%").limit(12)
    else
      @results = []
    end

    # いったん全部「新着順」に統一（done/likesを使わない）
    @stories  = Tweet.order(created_at: :desc).limit(6)
    @trending = Tweet.order(created_at: :desc).limit(6)
    @featured = Tweet.order(created_at: :desc).limit(6)
  end
end