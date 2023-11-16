class Scans::LanguagesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_scan, only: [:update]

    def update
        #binding.irb

        # @target = params[:target]
        # @states = CS.get(params[:country]).invert
        @scan.update(language: params[:language])

        # respond_to do |format|
        #   if @scan.update(language: params[:language])            
        #     format.turbo_stream { render "users/new_friend", 
        #         locals: {friend: friend, allowed: true, flash_notice: "#{params[:email]} was successfully added to your friends!" }
        #     }
        #     format.html { redirect_to scan_url(@scan), notice: "Scan was successfully updated." }
        #   else

        #   end
        #end
    end

    private

    def set_scan
        @scan = Scan.find(params[:scan_id]) if user_signed_in? 
    end

    def scan_params 
        params.require(:scan).permit(:title, :scan_content, :uploaded_image, :language)
    end
end