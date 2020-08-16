class TwittersController < ApplicationController
  def index
    @twitters = Twitter.all
  end
  def new
    @twitter = Twitter.new
  end
  def create
    @twitter = Twitter.create(content: params[:twitter][:content])
    if @twitter.save
      redirect_to new_twitter_path, notice: "つぶやきました！"
    else
      render :new
    end
  end
  def show
    @twitter = Twitter.find(params[:id])
  end
end
