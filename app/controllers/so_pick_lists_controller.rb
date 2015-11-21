class SoPickListsController < ApplicationController
  before_action :set_so_pick_list, only: [:show, :edit, :update, :destroy]
  before_filter :check_for_cancel, :only => [:create, :update]

   def check_for_cancel
     if params[:commit] == "Cancel"
       redirect_to new_so_pick_list_url
     end
   end
   
  # GET /so_pick_lists
  # GET /so_pick_lists.json
  def index
    @so_pick_lists = SoPickList.all
  end

  # GET /so_pick_lists/1
  # GET /so_pick_lists/1.json
  def show
    @so = SalesOrder.where(:id => @so_pick_list.sales_order_id)
    
    @customer = CustomerAccount.where(:id => @so.first.customer_account_id)

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
  end

  # GET /so_pick_lists/new
  def new
    @so_pick_list = SoPickList.new
  end

  # GET /so_pick_lists/1/edit
  def edit
  end

  # POST /so_pick_lists
  # POST /so_pick_lists.json
  def create
    @so_pick_list = SoPickList.new(so_pick_list_params)

    respond_to do |format|
      if @so_pick_list.save
        flash[:success] = "So pick list was successfully created!"
        format.html { redirect_to @so_pick_list }
        format.json { render :show, status: :created, location: @so_pick_list }
      else
        format.html { render :new }
        format.json { render json: @so_pick_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /so_pick_lists/1
  # PATCH/PUT /so_pick_lists/1.json
  def update
    respond_to do |format|
      if @so_pick_list.update(so_pick_list_params)
        flash[:success] = "So pick list was successfully updated!"
        format.html { redirect_to @so_pick_list }
        format.json { render :show, status: :ok, location: @so_pick_list }
      else
        format.html { render :edit }
        format.json { render json: @so_pick_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /so_pick_lists/1
  # DELETE /so_pick_lists/1.json
  def destroy
    @so_pick_list.destroy
    respond_to do |format|
      format.html { redirect_to so_pick_lists_url, notice: 'So pick list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_so_pick_list
      @so_pick_list = SoPickList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def so_pick_list_params
      params.require(:so_pick_list).permit(:sales_order_id, :order_line_id)
    end
end
