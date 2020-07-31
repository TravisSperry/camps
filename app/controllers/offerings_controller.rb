class OfferingsController < ApplicationController
  # GET /offerings
  # GET /offerings.json
  before_filter :authenticate_user!

  def index
    @offerings = Offering.order(:id).where(year: Offering::CURRENT_YEAR)
    @all_offerings = Offering.order(:id).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @offerings }
      format.csv { send_data @all_offerings.to_csv }
    end
  end

  # GET /offerings/1
  # GET /offerings/1.json
  def show
    @offering = Offering.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @offering }
    end
  end

  # GET /offerings/new
  # GET /offerings/new.json
  def new
    @offering = Offering.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @offering }
    end
  end

  # GET /offerings/1/edit
  def edit
    @offering = Offering.find(params[:id])
  end

  # POST /offerings
  # POST /offerings.json
  def create
    @offering = Offering.new(offering_params)

    respond_to do |format|
      if @offering.save
        format.html { redirect_to @offering, notice: 'Camp offering was successfully created.' }
        format.json { render json: @offering, status: :created, location: @offering }
      else
        format.html { render action: "new" }
        format.json { render json: @offering.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offerings/1
  # PATCH/PUT /offerings/1.json
  def update
    @offering = Offering.find(params[:id])

    respond_to do |format|
      if @offering.update_attributes(offering_params)
        format.html { redirect_to offerings_path, notice: 'Camp offering was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @offering.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offerings/1
  # DELETE /offerings/1.json
  def destroy
    @offering = Offering.find(params[:id])
    @offering.destroy

    respond_to do |format|
      format.html { redirect_to offerings_url }
      format.json { head :no_content }
    end
  end

  def import
    Offering.import(params[:file])
    redirect_to offerings_path, notice: "Camp offerings imported."
  end

  def week_at_a_glance
    @location = Location.find(params[:info][:location].to_i)
    @week = params[:info][:week]
    @offerings = Offering.where('week = ? AND location_id = ? AND year = ?', @week, @location.id, Offering::CURRENT_YEAR)
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def offering_params
      params.require(:offering).permit(:assistant, :id, :end_date, :location_id, :start_date, :teacher, :classroom, :time, :week, :hidden, :year, :extended_care)
    end
end
