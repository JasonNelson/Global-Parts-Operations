class SoShipmentsController < ApplicationController
  before_action :set_so_shipment, only: [:show, :edit, :update, :destroy]
  before_filter :check_for_cancel, :only => [:create, :update]

  def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to new_so_shipment_url
    end
  end
  # GET /so_shipments
  # GET /so_shipments.json
  def index
    @so_shipments = SoShipment.all
  end

  # GET /so_shipments/1
  # GET /so_shipments/1.json
  def show
     @states_hash = HashWithIndifferentAccess.new({"Alabama"=>"AL", "Alaska"=>"AK", "Arizona"=>"AZ", "Arkansas"=>"AR","California"=>"CA",
     "Colorado"=>"CO", "Connecticut"=>"CT", "Delaware"=>"DE", "District of Columbia"=>"DC",
     "Florida"=>"FL", "Georgia"=>"GA", "Hawaii"=>"HI", "Idaho"=>"ID", "Illinois"=>"IL",
     "Indiana"=>"IN", "Iowa"=>"IA","Kansas"=>"KS", "Kentucky"=>"KY", "Louisiana"=>"LA",
     "Maine"=>"ME","Maryland"=>"MD", "Massachusetts"=>"MA", "Michigan"=>"MI", "Minnesota"=>"MN",
     "Mississippi"=>"MS", "Missouri"=>"MO", "Montana"=>"MT","Nebraska"=>"NE", "Nevada"=>"NV",
     "New Hampshire"=>"NH", "NewJersey"=>"NJ", "New Mexico"=>"NM", "New York"=>"NY",
     "North Carolina"=>"NC", "North Dakota"=>"ND", "Ohio"=>"OH", "Oklahoma"=>"OK",
     "Oregon"=>"OR", "Pennsylvania"=>"PA", "Puerto Rico"=>"PR", "Rhode Island"=>"RI",
     "South Carolina"=>"SC", "South Dakota"=>"SD", "Tennessee"=>"TN", "Texas"=>"TX",
     "Utah"=>"UT", "Vermont"=>"VT", "Virginia"=>"VA", "Washington"=>"WA", "West Virginia"=>"WV",
     "Wisconsin"=>"WI", "Wyoming"=>"WY"})

     @order = SalesOrder.where(:id => @so_shipment.sales_order_id)

     @customer = CustomerAccount.where(:id => @order.first.customer_account_id)
  end

  # GET /so_shipments/new
  def new
    @so_shipment = SoShipment.new
  end

  # GET /so_shipments/1/edit
  def edit
  end

  # POST /so_shipments
  # POST /so_shipments.json
  def create
    @so_shipment = SoShipment.new(so_shipment_params)

    respond_to do |format|
      if @so_shipment.save
        flash[:success] = "Sales Order shipment was successful!"
        format.html { redirect_to @so_shipment }
        format.json { render :show, status: :created, location: @so_shipment }
      else
        format.html { render :new }
        format.json { render json: @so_shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /so_shipments/1
  # PATCH/PUT /so_shipments/1.json
  def update
    respond_to do |format|
      if @so_shipment.update(so_shipment_params)
        flash[:success] = "Sales Order shipment was successfully updated!"
        format.html { redirect_to @so_shipment }
        format.json { render :show, status: :ok, location: @so_shipment }
      else
        format.html { render :edit }
        format.json { render json: @so_shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /so_shipments/1
  # DELETE /so_shipments/1.json
  def destroy
    @so_shipment.destroy
    respond_to do |format|
      format.html { redirect_to so_shipments_url, notice: 'So shipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_so_shipment
      @so_shipment = SoShipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def so_shipment_params
      params.require(:so_shipment).permit(:sales_order_id, :customer_account_id, :ship_date, :ship_time, :expected_delivery_date, :carrier, :method, :tracking_num, :shipped_by)
    end
end
