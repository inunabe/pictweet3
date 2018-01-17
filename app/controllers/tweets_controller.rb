class TweetsController < ApplicationController

  before_action :move_to_index, except: :index
  # except(以外)index以外の全てのアクションより早くmove_to_indexを実行する
  # exceptがないとmove_to_indexを実行した後、indexに行かず、move_to_indexを永遠ループする


  def index
      @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
  end

  def create
    Tweet.create(image:tweet_params[:image],text:tweet_params[:text],user_id:current_user.id)
  end

  private
  def tweet_params
    params.permit(:image,:text)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
