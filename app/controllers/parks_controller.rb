class ParksController < ApplicationController

  def show
    @park = Park.find(params[:id])
    @rides = @park.rides.order(:name)
  end
end