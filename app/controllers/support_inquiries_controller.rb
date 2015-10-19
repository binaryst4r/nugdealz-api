class SupportInquiriesController < ApplicationController
  def create
    @support_inquiry = SupportInquiry.new(support_inquiry_params)
    respond_to do |format|
      if @support_inquiry.save
        format.html {redirect_to root_url, notice: 'Thanks for reaching out. We will review and contact you shortly.'}
      else
        format.html {redirect_to root_url, notice: 'Sorry something went wrong on that one.'}
      end
    end
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
