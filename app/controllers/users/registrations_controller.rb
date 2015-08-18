class Users::RegistrationsController < Devise::RegistrationsController
    
    #allows us to run our code before anything in controller runs
    before_filter :select_plan, only: :new
    
    def create
        super do |resource| #importing create action code from Devise
            if params[:plan] # sees if there is a 'plan' parameter submitted with form after user presses submit button
                resource.plan_id = params[:plan]
                if resource.plan_id == 2
                    resource.save_with_payment #if they are coming from pro account, saving with payment
                    #save_with_payment method is defined in model user.rb
                else
                    resource.save # if they are coming from basic account, just saves
                end
            end
        end
    end
    
    private
        def select_plan
            unless params[:plan] && (params[:plan] == '1' || params[:plan] == '2')
            flash[:notice] = "Please select a membership plan to sign up."
            redirect_to root_url
            end
        end
    
end