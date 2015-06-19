class ClaimsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :edit, :create, :destroy, :update]
  before_action :set_claim, only: [:show, :edit, :update, :destroy]

  # GET /claims
  # GET /claims.json
  def index
    if current_user.admin?
        @claims = Claim.all
    else
        @participations = Participation.where(user_id: current_user.id).where(author: true)
        @claims = []
        @participations.each do |p|
            @claims << p.claim
        end
    end
  end

  # GET /claims/1
  # GET /claims/1.json
  def show
  end

  # GET /claims/new
  def new
    @claim = Claim.new
  end

  # GET /claims/1/edit
  def edit
      if current_user != Participation.where(claim_id: @claim.id).where(author: true).first.user
          redirect_to claims_url
      end
  end

  # POST /claims
  # POST /claims.json
  def create
    @claim = Claim.new(claim_params)
    @claim.mailSend = false

    @participation = Participation.new
    @participation.user = current_user
    @participation.claim = @claim
    @participation.author = true
    respond_to do |format|
      if @claim.save && @participation.save
        if !params[:evidences].nil?
          params[:evidences].each do |picture|
            @claim.evidences.create(picture: picture, claim_id: @claim.id)
          end
        end
        format.html { redirect_to @claim, notice: 'Claim was successfully created.' }
        format.json { render :show, status: :created, location: @claim }
      else
        format.html { render :new }
        format.json { render json: @claim.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /claims/1
  # PATCH/PUT /claims/1.json
  def update
    if current_user == Participation.where(claim_id: @claim.id).where(author: true).first.user
      respond_to do |format|
        if @claim.update(claim_params)
          format.html { redirect_to @claim, notice: 'Claim was successfully updated.' }
          format.json { render :show, status: :ok, location: @claim }
        else
          format.html { render :edit }
          format.json { render json: @claim.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to claims_url
    end
  end

  # DELETE /claims/1
  # DELETE /claims/1.json
  def destroy
    if current_user.admin? || @claim.user = current_user
      @claim.evidences.each do |evidence|
        evidence.destroy
      end
      @claim.destroy
      respond_to do |format|
        format.html { redirect_to claims_url, notice: 'Claim was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to claims_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_claim
      @claim = Claim.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def claim_params
      params.require(:claim).permit(:title, :description, :state, :picture)
    end
end
