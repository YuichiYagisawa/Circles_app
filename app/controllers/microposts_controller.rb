class MicropostsController < ApplicationController
  # before_action :logged_in_user, only: [:create, :destroy]

  def index
    @microposts = Micropost.all
  end

  def show
    @micropost = Micropost.find(params[:id])
  end

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = Micropost.new(micropost_params)
    if @micropost.save
      redirect_to microposts_path
    else
      render 'new'
    end
  end


  def destroy

  end

  private
    def micropost_params
      params.require(:micropost).permit(:content,:circle_id)
    end
end
