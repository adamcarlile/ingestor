class EventsController

  def create
    if resource.valid?
      resource.save!
      render json: { lead_id: resource.id }
    else
      head :unprocessable_entity
    end
  end

  private

  def resource
    @resource ||= Event.new(permitted_params)
  end

  def permitted_params
    params.permit(:event, payload: {}, metadata: {}, :created_at)
  end

end