class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update destroy ]
  before_action :check_sidebar_display, only: %i[ show ]
  before_action :authenticate_user!
  before_action :authorise_user!, only: %i[ edit destroy ]

  # GET /profiles/1
  def show
    if current_user.profile.id == params[:id].to_i
      # Current users profile
      render "user_profile"
    else
      # Non current user's profile
      render "show"
    end
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  def create

    @profile = current_user.profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to edit_profile_path, notice: "Profile successfully created!" }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  def update
    respond_to do |format|

      # If blank update return profile unaltered without error
      if !params[:profile]
        redirect_to profile_path(@profile.id)
        return 
      end

      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: "Profile was successfully updated!" }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: "Profile was successfully destroyed!" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:bio, :location, :postcode, :user_id, :image, :address)
    end

    # To allow immediate display of watchlist via front end code
    def check_sidebar_display
      @display = params["display"]
    end

    def authorise_user!
      if current_user.id != @profile.user.id
        flash[:alert] = "Request not authorised!"
        redirect_to root_url
      end
    end
end
