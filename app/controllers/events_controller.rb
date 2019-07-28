class EventsController < ApplicationController
  include Wisper::Publisher

  def create
    if resource.valid?
      resource.save!
      broadcast(:event_created, resource.to_global_id.to_s)
      render json: { event_id: resource.id }
    else
      head :unprocessable_entity
    end
  end

  private

  def resource
    @resource ||= Event.new(permitted_params)
  end

  def permitted_params
    params.permit(:name, :created_at, payload: {}, metadata: {})
  end

end