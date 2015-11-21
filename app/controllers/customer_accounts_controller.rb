class CustomerAccountsController < ApplicationController
  before_action :set_customer_account, only: [:show, :edit, :update, :destroy]
  before_filter :check_for_cancel, :only => [:create, :update]

def check_for_cancel
  if params[:commit] == "Cancel"
    redirect_to new_customer_account_url
  end
end

  # GET /customer_accounts
  # GET /customer_accounts.json

  def index
    @customer_accounts = CustomerAccount.paginate(page: params[:page])
  end

  # GET /customer_accounts/1
  # GET /customer_accounts/1.json
  def show
  end

  # GET /customer_accounts/new
  def new
    @customer_account = CustomerAccount.new
  end

  # GET /customer_accounts/1/edit
  def edit
  end

  # POST /customer_accounts
  # POST /customer_accounts.json
  def create
    @customer_account = CustomerAccount.new(customer_account_params)

    respond_to do |format|
      if @customer_account.save
        flash[:success] = "Customer account was successfully created!"
        format.html { redirect_to @customer_account }
        format.json { render :show, status: :created, location: @customer_account }
      else
        format.html { render :new }
        format.json { render json: @customer_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_accounts/1
  # PATCH/PUT /customer_accounts/1.json
  def update
    respond_to do |format|
      if @customer_account.update(customer_account_params)
        flash[:success] = "Customer account was successfully updated!"
        format.html { redirect_to @customer_account }
        format.json { render :show, status: :ok, location: @customer_account }
      else
        format.html { render :edit }
        format.json { render json: @customer_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_accounts/1
  # DELETE /customer_accounts/1.json
  def destroy
    @customer_account.destroy
    respond_to do |format|
      format.html { redirect_to customer_accounts_url, notice: 'Customer account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_account
      @customer_account = CustomerAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_account_params
      params.require(:customer_account).permit(:fname, :middle_initial, :lname, :street_add, :city, :state, :zipcode, :email, :home_phone, :cell_phone, :phone_pref, :password)
    end
end
