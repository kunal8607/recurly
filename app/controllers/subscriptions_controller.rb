class SubscriptionsController < ApplicationController
  # GET /subscriptions
  # GET /subscriptions.json
  def index
    @subscriptions = Subscription.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subscriptions }
    end
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  #def show
  #  @subscription = Subscription.find(params[:id])
  #
  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.json { render json: @subscription }
  #  end
  #end

  # GET /subscriptions/new
  # GET /subscriptions/new.json
  def new
    @subscription = Subscription.new
    @accounts = Recurly::Account.all
    @plans = Recurly::Plan.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subscription }
    end
  end

  # GET /subscriptions/1/edit
  #def edit
  #  @subscription = Subscription.find(params[:id])
  #end

  # POST /subscriptions
  # POST /subscriptions.json
  def create
    #@subscription = Subscription.new(params[:subscription])
    @plan = Recurly::Plan.find(params[:subscription][:plan])
    @account = Recurly::Account.find(params[:subscription][:account])
    subscription = Recurly::Subscription.create(
        :plan_code => @plan.plan_code,
        :currency  => 'USD',
        :account   => @account
    )
    logger.info @plan.inspect
    logger.info @account.inspect
    redirect_to root_path, :notice => "Subscribed successfully"
  end

  # PUT /subscriptions/1
  # PUT /subscriptions/1.json
  #def update
  #  @subscription = Subscription.find(params[:id])
  #
  #  respond_to do |format|
  #    if @subscription.update_attributes(params[:subscription])
  #      format.html { redirect_to @subscription, notice: 'Subscription was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: "edit" }
  #      format.json { render json: @subscription.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  #def destroy
  #  @subscription = Subscription.find(params[:id])
  #  @subscription.destroy
  #
  #  respond_to do |format|
  #    format.html { redirect_to subscriptions_url }
  #    format.json { head :no_content }
  #  end
  #end
end
