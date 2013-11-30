# -*- encoding : utf-8 -*-
class ReleasesController < ApplicationController
  # GET /releases
  # GET /releases.json
  def index
    #@releases = Release.all
    @releases = Release.where(cashier_id: current_user.cashier.id, view: true)

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @releases }
    # end
  end

  # GET /releases/1
  # GET /releases/1.json
  def show
    @release = Release.find(params[:id])

    # respond_to do |format|
    #   format.html  show.html.erb
    #   format.json { render json: @release }
    # end
  end

  # GET /releases/new
  # GET /releases/new.json
  def new
    @release = Release.new
    @cashier = Cashier.find(params[:cashier_id])
    # @release.type_release = params[:type_release]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @release }
    end
  end

  # GET /releases/1/edit
  def edit
    @cashier = Cashier.find(params[:cashier_id])
    @release = @cashier.releases.find(params[:id])

  end

  # POST /releases
  # POST /releases.json
  def create
    @cashier = Cashier.find(params[:cashier_id])
    @release = @cashier.releases.new(params[:release])

    #@release.date_release = post_date Date.today
    respond_to do |format|
      if @release.save
        format.html { redirect_to cashiers_path(@cashier), notice: 'Release was successfully created.' }
        #format.html { redirect_to cashier_release_path(@release.cashier, @release), notice: 'Release was successfully created.' }
        format.json { render json: @release, status: :created, location: @release }
      else
        format.html { render action: "new" }
        format.json { render json: @release.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /releases/1
  # PUT /releases/1.json
  def update
    @release = Release.find(params[:id])

    respond_to do |format|
      if @release.update_attributes(params[:release])
        format.html { redirect_to cashier_release_path(current_user), notice: 'Release was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @release.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /releases/1
  # DELETE /releases/1.json
  def destroy    
    @release = Release.find(params[:id])
    #update_cashier(@release.value * -1)
    @release.view = false
    @release.save
    
    respond_to do |format|
      format.html { redirect_to cashier_path(params[:cashier_id]) }
      format.json { head :no_content }
    end
  end

end
