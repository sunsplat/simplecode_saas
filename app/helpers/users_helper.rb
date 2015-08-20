module UsersHelper
    def job_title_icon
        if @user.profile.job_title == "House Sitter"
            "<i class= 'fa fa-heart'></i>".html_safe
        elsif @user.profile.job_title == "Pet Sitter"
            "<i class= 'fa fa-github-alt'></i>".html_safe
        elsif @user.profile.job_title == "Home Owner"
            "<i class= 'fa fa-h-square'></i>".html_safe
        end
    end
end