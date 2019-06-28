class CirclesController < ApplicationController
  before_action :logged_in_user
  before_action :set_circle, only: [:show, :edit, :update, :destroy]

  # GET /circles
  # GET /circles.json
  def index
    @circles = Circle.all
  end

  # GET /circles/1
  # GET /circles/1.json
  def show
    @circle = Circle.find(params[:id])
    # @microposts.circle_id = Circle.find(params[:id])
    @microposts = @circle.microposts
  end

  # GET /circles/new
  def new
    @circle = Circle.new
    # @circle.user_circle_relationship.build
  end

  # GET /circles/1/edit
  def edit
  end

  # POST /circles
  # POST /circles.json
  def create
    @circle = Circle.new(circle_params)
    @circle.save
    @relationship = UserCircleRelationship.new(
      user_id: current_user.id,
      circle_id: @circle.id,
      admin: 3
    )

    respond_to do |format|
      if @relationship.save
        # @relationship.save
        format.html { redirect_to @circle, notice: 'Circle was successfully created.' }
        format.json { render :show, status: :created, location: @circle }
      else
        format.html { render :new }
        format.json { render json: @circle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /circles/1
  # PATCH/PUT /circles/1.json
  def update
    respond_to do |format|
      if @circle.update(circle_params)
        format.html { redirect_to @circle, notice: 'Circle was successfully updated.' }
        format.json { render :show, status: :ok, location: @circle }
      else
        format.html { render :edit }
        format.json { render json: @circle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /circles/1
  # DELETE /circles/1.json
  def destroy
    @circle.destroy
    respond_to do |format|
      format.html { redirect_to circles_url, notice: 'Circle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def followers
    @followers = UserCircleRelationship.where(circle_id: params[:circle_id])
  end

  def follow
    @relationship = UserCircleRelationship.new(
        user_id: current_user.id,
        circle_id: params[:circle_id],
        admin: 1
    )
    respond_to do |format|
      if @relationship.save
        format.html { redirect_to circle_path(params[:circle_id]), notice: 'Circle was successfully created.' }
        format.json { render :show, status: :created, location: @circle }
      else
        format.html { render :new }
        format.json { render json: @circle.errors, status: :unprocessable_entity }
      end
    end
  end

  def unfollow
    @relationship = UserCircleRelationship.find_by(user_id: current_user.id)
    @relationship.destroy
    redirect_to circle_path(params[:circle_id])
  end

  def member
    @member = UserCircleRelationship.find_by(
        circle_id: params[:circle_id],
        user_id: params[:user_id]
    )
    @member.admin = 2
    respond_to do |format|
      if @member.save
        format.html { redirect_to circle_path(params[:circle_id]), notice: 'Circle was successfully created.' }
        format.json { render :show, status: :created, location: @circle }
      else
        format.html { render :new }
        format.json { render json: @circle.errors, status: :unprocessable_entity }
      end
    end
  end

  def unmember
    @member = UserCircleRelationship.find_by(
        circle_id: params[:circle_id],
        user_id: params[:user_id]
    )
    @member.admin = 1
    respond_to do |format|
      if @member.save
        format.html { redirect_to circle_path(params[:circle_id]), notice: 'Circle was successfully created.' }
        format.json { render :show, status: :created, location: @circle }
      else
        format.html { render :new }
        format.json { render json: @circle.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_circle
      @circle = Circle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def circle_params
      params.require(:circle).permit(
          :circle_name, :circle_email, :circle_info
      )
    end
end
