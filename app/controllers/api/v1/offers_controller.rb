class Api::V1::OffersController < Api::ApplicationController
  include SerializedUserOffer
  before_action :set_offer, only: %i[ show ]
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
    @offer_detail = OfferDetail.find(update_params[:offer_detail_id])

    if @offer_detail.update(play_hours: update_params[:play_hours])
      render json: { message: 'Updated successfully' }, status: :ok
    else
      render json: { errors: @offer_detail.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def update_params
    params.require(:offer_detail).permit(:play_hours, :offer_detail_id)
  end

  def authenticate_admin
    render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_user.admin?
  end
end
