class Scans::UploadedImagesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_scan, only: [:destroy, :update]

    include ActionView::RecordIdentifier # include dom_id method identifier
  
    def destroy
        #binding.irb
        @scan.uploaded_image.purge_later
        # redirect_to edit_blog_post_path(@scan)
        respond_to do |format|
            format.turbo_stream { render turbo_stream: turbo_stream.remove(dom_id(@scan, :uploaded_image))}
            format.html {redirect_to edit_scan_path(@scan) }
        end
    end


    # PATCH/PUT /scans/1 or /scans/1.json
    def update
        # binding.irb
        img = @scan.uploaded_image
        url = url_for(img)
        
        #abs_url = request.base_url + url
        
        #img = RTesseract.new(url1, lang: 'deu')
        img_tesseract = RTesseract.new(url, lang:  @scan.language)
        #binding.irb
        img__scan = img_tesseract.to_s

        #img_tesseract = RTesseract.new(abs_url, lang: 'deu')


        respond_to do |format|
            #if @scan.uploaded_image.update(scan_params)

           if @scan.update(scan_content: img__scan)
                format.html { redirect_to scan_url(@scan), notice: "Scan was successfully updated." }
                format.json { render :show, status: :ok, location: @scan }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @scan.errors, status: :unprocessable_entity }
            end
        end
    end

    private

    def set_scan
        @scan = Scan.find(params[:scan_id]) if user_signed_in? 
    end

    def scan_params 
        params.require(:scan).permit(:title, :scan_content, :uploaded_image, :language)
    end
  
end