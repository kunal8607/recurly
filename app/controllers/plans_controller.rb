class PlansController < ApplicationController
  # GET /plans
  # GET /plans.json
  def index
    @plans = Recurly::Plan.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @plans }
    end
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
    @plan = Plan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @plan }
    end
  end

  # GET /plans/new
  # GET /plans/new.json
  def new
    @plan = Plan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @plan }
    end
  end

  # GET /plans/1/edit
  def edit
    @plan = Plan.find(params[:id])
  end

  # POST /plans
  # POST /plans.json
  def create
    plan = Recurly::Plan.create(
        :plan_code            => params[:plan][:name],
        :name                 => params[:plan][:name],
        :description          => params[:plan][:description],
        :unit_amount_in_cents => { 'USD' => params[:plan][:amount].to_i},
        :plan_interval_length => 6,
        :plan_interval_unit   => "months"
        #:trial_interval_length   => params[:trial_interval_length],
        #:trial_interval_unit   => params[:trial_interval_unit]
    )
    #@plan = Plan.new(params[:plan])


    #plan = Recurly::Plan.create(
    #    :plan_code            => 'gold',
    #    :name                 => 'Gold plan',
    #    :unit_amount_in_cents => { 'USD' => 10_00, 'EUR' => 8_00 },
    #    :setup_fee_in_cents   => { 'USD' => 60_00, 'EUR' => 45_00 },
    #    :plan_interval_length => 1,
    #    :plan_interval_unit   => 'months'
    #)
    respond_to do |format|
      #if @plan.save
        format.html { redirect_to plans_path, notice: 'Plan was successfully created.' }
        #format.json { render json: @plan, status: :created, location: @plan }
      #else
      #  format.html { render action: "new" }
      #  format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end


  # PUT /plans/1
  # PUT /plans/1.json
  def update
    @plan = Plan.find(params[:id])

    respond_to do |format|
      if @plan.update_attributes(params[:plan])
        format.html { redirect_to @plan, notice: 'Plan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy

    respond_to do |format|
      format.html { redirect_to plans_url }
      format.json { head :no_content }
    end
  end
end
