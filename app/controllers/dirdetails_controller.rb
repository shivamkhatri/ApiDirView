class DirdetailsController < ApplicationController
  before_action :set_dirdetail, only: [:show, :update, :destroy]

  # GET /dirdetails
  def index
    @dirdetails = Dirdetail.find_by path: "#{params[:path]}"
    puts "#{params[:name]}"
    render json: @dirdetails
  end

  # GET /dirdetails/1
  def show
    render json: @dirdetail
  end

  # POST /dirdetails
  def create
    @dirdetail = Dirdetail.new(dirdetail_params)

    if @dirdetail.save
      render json: @dirdetail, status: :created, location: @dirdetail
    else
      render json: @dirdetail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dirdetails/1
  def update
    if @dirdetail.update(dirdetail_params)
      render json: @dirdetail
    else
      render json: @dirdetail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dirdetails/1
  def destroy
    @dirdetail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dirdetail
      @dirdetail = Dirdetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dirdetail_params
      params.require(:dirdetail).permit(:name, :path, :owner, :ptype)
    end
end
