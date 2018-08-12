class MaterialOrdersController < ApplicationController
  def index
  end

  def new
  	@material_order = MaterialOrder.new
  end
end
