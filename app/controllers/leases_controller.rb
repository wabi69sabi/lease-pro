class LeasesController < ApplicationController
  before_action :set_lease, only: [:show, :edit, :update, :destroy]

  # GET /leases
  # GET /leases.json
  def index
    @leases = Lease.all
  end

  # GET /leases/1
  # GET /leases/1.json
  def show
    authorize! :read, @lease
  end

  # GET /leases/new
  def new
    @lease = Lease.new
    find_users
  end

  # GET /leases/1/edit
  def edit
    authorize! :update, @lease
    find_users
  end

  # POST /leases
  # POST /leases.json
  def create
    @lease = Lease.new(lease_params)

    authorize! :create, @lease

    respond_to do |format|
      if @lease.save
        format.html { redirect_to @lease, notice: 'Lease was successfully created.' }
        format.json { render :show, status: :created, location: @lease }
      else
        format.html { render :new }
        format.json { render json: @lease.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leases/1
  # PATCH/PUT /leases/1.json
  def update
    authorize! :update, @lease

    find_users

    respond_to do |format|
      if @lease.update(lease_params)
        format.html { redirect_to @lease, notice: 'Lease was successfully updated.' }
        format.json { render :show, status: :ok, location: @lease }
      else
        format.html { render :edit }
        format.json { render json: @lease.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leases/1
  # DELETE /leases/1.json
  def destroy
    authorize! :update, @lease

    @lease.destroy
    respond_to do |format|
      format.html { redirect_to leases_url, notice: 'Lease was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lease
      @lease = Lease.find(params[:id])
    end

    def find_users
      @managers = User.where(role: 'manager')
      @tenants = User.where(role: 'tenant')
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lease_params
      params.fetch(:lease).permit(:address, :city, :state, :country, :rent, :start_date, :end_date, :due_date, :owner, :manager, :tenant, :accepted)
    end
end
