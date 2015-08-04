class SupportInquiriesController < ApplicationController
  def create
  end

  def update
  end

  def show
  end

  def index
  end

  def destroy
  end

  private

  def support_inquiry_params
    params.require(:support_inquiry).permit(:email, :message, :subject, :user_id)
  end
end
