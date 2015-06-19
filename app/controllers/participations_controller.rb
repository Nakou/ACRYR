class ParticipationsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :join, :destroy]
  before_action :set_participation, only: [:destroy]

  # GET /participations
  # GET /participations.json
  def index
    if current_user.admin?
        @participations = Participation.all
    else
        @participations = Participation.where(user_id: current_user.id)
    end
  end

  # GET /participations/join/1
  def join
    @participation = Participation.new
    @participation.user = current_user
    @participation.claim_id = params[:claim_id]
    @participation.author = false
    @claim = Claim.find(params[:claim_id])

    notice = 'Participation was successfully created.'
    if !@claim.participations.nil? && @claim.participations.count == 9
      require "application_mailer"
      ApplicationMailer.send_mail_claim(@claim)
      notice << '  Email send for 10th participant'
    end

    respond_to do |format|
      if @participation.save
        format.html{ redirect_to root_path, notice: notice }
      else
        format.html{ redirect_to root_path, notice: 'Oops, you can\'t to this claim !' }
      end
    end
  end

  # DELETE /participations/1
  # DELETE /participations/1.json
  def destroy
    if @participation.author == true
        @claim = @participation.claim
        Participation.where(claim_id: @claim.id).destroy_all
        @claim.destroy
    end
    @participation.destroy
    respond_to do |format|
      format.html { redirect_to participations_url, notice: 'Participation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participation
      @participation = Participation.find(params[:id])
    end
end
