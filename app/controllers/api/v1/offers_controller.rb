class Api::V1::OffersController < Api::ApplicationController
  before_action :set_offer, only: %i[ show edit update destroy ]
  before_action :conditional_authenticate_admin, only: %i[index]
  before_action :authenticate_admin, except: %i[index]

  # GET /offers or /offers.json
  def index
    collection = admin? ? Offer.all : OfferQuery.user_specific_offers(@current_user)
    render json: OfferSerializer.serialize_collection(collection: collection)
  end

  # GET /offers/1 or /offers/1.json
  def show
    render json: OfferSerializer.new(@offer).serializable_attributes
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers or /offers.json
  def create
    @offer = Offer.new(offer_params)

    respond_to do |format|
      if @offer.save
        format.html { redirect_to offer_url(@offer), notice: "Offer was successfully created." }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1 or /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to offer_url(@offer), notice: "Offer was successfully updated." }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1 or /offers/1.json
  def destroy
    @offer.destroy

    respond_to do |format|
      format.html { redirect_to offers_url, notice: "Offer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_offer
    @offer = Offer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def offer_params
    params.require(:offer).permit(:description)
  end

  def authenticate_admin
    render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_user.admin?
  end

  def conditional_authenticate_admin
    render json: { error: 'Unauthorized' }, status: :unauthorized if unauthorized_request?
  end

  def admin?
    params['role'] == 'admin' && @current_user.admin?
  end

  def unauthorized_request?
    params['role'] == 'admin' && !@current_user.admin?
  end
end
