class TweetsController < ApplicationController

  before_action :move_to_index, except: :index
  # except(以外)index以外の全てのアクションより早くmove_to_indexを実行する
  # exceptがないとmove_to_indexを実行した後、indexに行かず、move_to_indexを永遠ループする


  def index
      @tweets = Tweet.all.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
  end

  def create
    Tweet.create(tweet_params)
  end

  private
  def tweet_params
    params.permit(:name,:image,:text)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
