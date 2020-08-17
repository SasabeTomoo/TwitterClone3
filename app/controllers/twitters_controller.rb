class TwittersController < ApplicationController
  before_action :set_twitter, only: [:show, :edit, :update, :destroy]
  def index
    @twitters = Twitter.all
  end
  def new
    @twitter = Twitter.new
  end
  def create
    @twitter = Twitter.new(content: params[:twitter][:content])
    if params[:back]
      render :new
    else
      if @twitter.save
        redirect_to twitters_path, notice: "つぶやきました！"
      else
        render :new
      end
    end
  end
  def show
  end
  def edit
  end
  def update
    if @twitter.update(content: params[:twitter][:content])
      redirect_to twitters_path, notice: "編集しました"
    else
      render :edit
    end
  end
  def destroy
    @twitter.destroy
    redirect_to twitters_path, notice:"削除しました"
  end
  def confirm
    @twitter = Twitter.new(content: params[:twitter][:content])
    render :new if @twitter.invalid?
  end
  def set_twitter
    @twitter = Twitter.find(params[:id])
  end
end
