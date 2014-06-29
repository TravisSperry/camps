class CampSurveysController < ApplicationController
  before_action :set_camp_survey, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
    @camp_surveys = CampSurvey.all
    respond_with(@camp_surveys)
  end

  def show
    respond_with(@camp_survey)
  end

  def new
    @camp_survey = CampSurvey.new
    respond_with(@camp_survey)
  end

  def edit
  end

  def create
    @camp_survey = CampSurvey.new(camp_survey_params)
    @camp_survey.save
    respond_with @camp_survey do |format|
      format.html {
        redirect_to new_camp_survey_path(camp_id: @camp_survey.camp_id, location_id: @camp_survey.location_id),
        notice: "Survey Added. If you are adding a survey for a different camp
        please be sure to change the selected camp."}
    end
  end

  def update
    @camp_survey.update(camp_survey_params)
    respond_with(@camp_survey)
  end

  def destroy
    @camp_survey.destroy
    respond_with(@camp_survey)
  end

  private
    def set_camp_survey
      @camp_survey = CampSurvey.find(params[:id])
    end

    def camp_survey_params
      params.require(:camp_survey).permit(
                                          :satisfaction,
                                          :comment,
                                          :improvements,
                                          :parent_first_name,
                                          :parent_last_name,
                                          :student_name,
                                          :grade_completed,
                                          :phone,
                                          :email,
                                          :contact_time,
                                          :preferred_contact,
                                          :contact_fall,
                                          {weekly_program_ids: []},
                                          :camp_id,
                                          :location_id)
    end
end
