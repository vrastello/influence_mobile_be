class Api::V1::OffersController < Api::ApplicationController
  include SerializedUserOffer
  before_action :set_offer, only: %i[show]
  before_action :authenticate_admin, except: %i[index]

  def index
    render json: serialized_user_offer, status: :ok
  end

  def admin_offers
    render json: OfferSerializer.serialize_collection_with_root(collection: Offer.all)
  end

  def show
    render json: OfferSerializer.new(@offer).serializable_attributes
  end

  def log_play_hours
    LogPlayHoursService.new(params: update_params, user: @current_user).log

    render json: { message: 'Play hours logged successfully' }, status: :ok
  rescue StandardError => e
    puts e.message.inspect
    render json: { errors: e.message }, status: :unprocessable_entity
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def update_params
    params.require(:offer).permit(:play_hours, :offer_id)
  end

  def authenticate_admin
    render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_user.admin?
  end
end
