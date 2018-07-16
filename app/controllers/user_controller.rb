class UserController < ApplicationController 
    def mypage
        @user = current_user
        @my_project = Project.where(admin_id: current_user.id)
        render 'mypage'
    end

    def edit
        @user = current_user
        render 'mypage_edit'
    end

    def update
        @user = current_user
        @user.name = params[:name]
        @user.institution = params[:institution]
        @user.research_interests = params[:research_interests]
        @user.introduction = params[:introduction]
        @user.save
        redirect_to action: 'mypage'
    end
end
