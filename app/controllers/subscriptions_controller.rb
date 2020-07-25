class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:destroy]

  # POST /subscriptions
  def create
    @subscription = Subscription.new(subscription_params)
    @subscription['subscriber_id'] = curr_user.id
    if @subscription.save
      render json: @subscription, status: :created, location: @subscription
    else
      render json: @subscription.errors, status: :unprocessable_entity
    end
  end


  # DELETE /subscriptions/1
  def destroy
    render json: @subscription.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find_by(subscribee_id: params[:id], subscriber_id: curr_user.id)
    end

    # Only allow a trusted parameter "white list" through.
    def subscription_params
      params.require(:subscription).permit(:subscribee_id)
    end
end
