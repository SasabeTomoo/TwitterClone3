class TwittersController < ApplicationController
  def index
    @twitters = Twitter.all
  end
  def new
    @twitter = Twitter.new
  end
  def create
    Twitter.create(content: params[:twitter][:content])
    redirect_to new_twitter_path
  end
  def show
    @twitter = Twitter.find(params[:id])
  end
end
