class TenantsController < ApplicationController

  def index
    tens = Tenant.all
    render json: tens, status: :ok
  end

  def show
    ten = Tenant.find(params[:id])
    render json: ten, status: :ok
  end

  def create
    ten = Tenant.create!(tenant_params)
    render json: ten, status: :created
  end

  def update
    ten = Tenant.find(params[:id])
    ten.update!(tenant_params)
    render json: ten, status: :accepted
  end

  def destroy
    ten = Tenant.find(params[:id])
    ten.destroy
    head :no_content
  end

  private

  def tenant_params
    params.permit(:name, :age)
  end

end
