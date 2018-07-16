class UserController < ApplicationController 
    def mypage
        @user = current_user
        @my_project = Project.where(admin_id: current_user.id)
        render 'mypage'
    end

    def edit
        @user = current_user
    end
end
