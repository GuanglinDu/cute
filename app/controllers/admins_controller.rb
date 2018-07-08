class AdminsController < ApplicationController
  before_action :set_admin, only: [:update, :destroy]

  def index
    @admins = Admin.all
  end

  # def show
  # end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      if @admin.update_attributes(admin_params)
        format.html { redirect_to admins_url }
        flash[:success] = 'Admin was successfully updated!'
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors,
                             status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_url }
      flash[:success] = 'Admin was successfully destroyed!'
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:name, :role, :email)
  end
end
