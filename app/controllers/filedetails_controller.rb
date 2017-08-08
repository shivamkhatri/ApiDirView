class FiledetailsController < ApplicationController
  before_action :set_filedetail, only: [:show, :update, :destroy]

  # GET /filedetails
  def index
    @filedetails = Filedetail.all

    render json: @filedetails
  end

  # GET /filedetails/1
  def show
    render json: @filedetail
  end

  # POST /filedetails
  def create
    @filedetail = Filedetail.new(filedetail_params)

    if @filedetail.save
      render json: @filedetail, status: :created, location: @filedetail
    else
      render json: @filedetail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /filedetails/1
  def update
    if @filedetail.update(filedetail_params)
      render json: @filedetail
    else
      render json: @filedetail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /filedetails/1
  def destroy
    @filedetail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_filedetail
      @filedetail = Filedetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def filedetail_params
      params.require(:filedetail).permit(:name, :path, :owner, :ptype)
    end
end
