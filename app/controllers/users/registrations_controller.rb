class Users::RegistrationsController < Devise::RegistrationsController
    
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
    
end