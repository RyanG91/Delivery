class ServicesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  # GET /services
  # GET /services.json
  def index
    @services = Service.all
    filtering_params.each do |key, value|
      @services = @services.public_send(key, value) if value.present?
    end
  end

  # GET /services/1
  # GET /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
    not_authorised and return unless current_user.can_update? (@service)
  end

  # POST /services
  # POST /services.json
  def create

    @service = Service.new(service_params)
    @service.driver_id = current_user.email

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    not_authorised and return unless current_user.can_update? (@service)
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    not_authorised and return unless current_user.can_delete?(@service)
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    def filtering_params
       params.slice(:vehicle, :service_id, :cost)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:service_id, :image, :vehicle, :name, :cost, :distance, :driver_id)
    end

    def not_authorised
      flash[:notice] = "You are not authorised!"
      redirect_to services_path
    end
end
