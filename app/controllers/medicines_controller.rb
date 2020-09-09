class MedicinesController < ApplicationController
  before_action :set_message, only: [:show, :destroy]


  respond_to? :html, :json

  def new
    @medicine = Medicine.new
    respond_modal_with @medicine
  end

  def create 
    @medicine = Medicine.new(medicine_params)
    if @medicine.save
      respond_modal_with @medicine, location: overview_path
    else
      #
    end

  end



  def show
    @medicine = Medicine.find(params[:id])
  end

  def index
    @medicine = Medicine.paginate(page: params[:page], per_page:20)
  end

  def sell
  end

  private 
    def medicine_params
      params.require(:medicine).permit(:name, :barcode, :active_substance, :unit_gram, :unit, :tva)
    end


end
