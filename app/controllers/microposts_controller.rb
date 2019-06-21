class MicropostsController < ApplicationController
  # before_action :set_circle
  # before_action :logged_in_user, only: [:create, :destroy]

  # def index
  #   @microposts = Micropost.all
  # end

  def show
    @micropost = Micropost.find_by(id: params[:id])
  end

  def new
    @circle = Circle.find(params[:circle_id])
    @micropost = Micropost.new
  end

  def edit
  end

  def create
    @micropost = Micropost.new(micropost_params)

    respond_to do |format|
      if @micropost.save
        format.html { redirect_to circles_path, notice: 'Micropost was successfully created.' }
        format.json { render :show, status: :created, location: @circle }
      else
        format.html { render :new }
        format.json { render json: @circle.errors, status: :unprocessable_entity }
      end
    end
    # if @micropost.save
    #   redirect_to circle_path
    # else
    #   render 'new'
    # end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @micropost.update(micropost_params)
        format.html { redirect_to @micropost, notice: 'micropost was successfully updated.' }
        format.json { render :show, status: :ok, location: @micropost }
      else
        format.html { render :edit }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @micropost.destroy
    respond_to do |format|
      format.html { redirect_to circle_path, notice: 'micropost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # def set_circle
    #   @circle = Circle.find(params[:id])
    # end

    def micropost_params
      params.require(:micropost).permit(:content).merge(circle_id: params[:circle_id])
    end
end
