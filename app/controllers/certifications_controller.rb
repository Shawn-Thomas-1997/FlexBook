class CertificationsController < ApplicationController
  def index
    @certifications = current_user.certifications.all
  end

  def new
    @certification = Certification.new
  end

  def create
    @certification = current_user.certifications.new(certification_params)
    if @certification.save
      redirect_to certifications_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @certification = Certification.find(params[:id])
    @certification.destroy
    redirect_to certifications_path, status: :see_other
  end

  private

  def certification_params
    params.require(:certification).permit(:photo)
  end
end
