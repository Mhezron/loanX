class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]


  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Customer not found."
    redirect_to customers_path
  end

  def new
    @customer = Customer.new
    loan = @customer.loans.build
    loan.build_phone
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:notice] = "Customer has been successfully created."
      redirect_to customers_path
    else
      render :new
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "Customer details updated successfully."
      redirect_to @customer
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_path, notice: "Customer has been deleted successfully."
  end

  private
  def set_customer
    @customer = Customer.find(params[:id])
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :id_number, :phone_number, :dob,
    loans_attributes: [
      :loan_amount, :interest, :repayment_day, :repayment_amount, phone_attributes: [:phone_model, :phone_make, :code]
    ]
    )
  end 
end
