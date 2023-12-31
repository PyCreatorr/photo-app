class RegistrationsController < Devise::RegistrationsController
    def create

      build_resource(sign_up_params)

      # resource.class.transaction do # customised

        resource.save
        yield resource if block_given?

        if resource.persisted?

          # CREATE PAYMENT PART. payment.rb
          # @payment = Payment.new({ email: params["user"]["email"], 
          #   token: params[:payment]["token"], user_id: resource.id })

          # flash[:error] = "Please check registration errors" unless @payment.valid?
          # begin
          #   @payment.process_payment
          #   @payment.save

          # rescue => exception
          #   flash[:error] = exception.message
          #   resource.destroy
          #   puts 'Payment failded'
          #   render :new and return            
          # end

          # DEVISE PART. Register user.
          # Copied from https://github.com/heartcombo/devise/blob/main/app/controllers/devise/registrations_controller.rb

          if resource.active_for_authentication?
            set_flash_message! :notice, :signed_up
            sign_up(resource_name, resource)
            respond_with resource, location: after_sign_up_path_for(resource)
          else
            set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
            expire_data_after_sign_in!
            respond_with resource, location: after_inactive_sign_up_path_for(resource)
          end

        else
          clean_up_passwords resource
          set_minimum_password_length
          respond_with resource
        end
      # end
    end

    protected

    # def configure_permitted_parameters
    #   # devise_parameter_sanitizer.for(:sign_up).push(:payment) - from rails 5
    #   devise_parameter_sanitizer.permit(:sign_up, keys: [:payment])
    # end
end