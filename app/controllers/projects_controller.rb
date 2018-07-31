class ProjectsController < ApplicationController 
    def index
        @projects = Project.all
        render 'index'
    end  

    def new
        @project = Project.new
    end

    def create
        @project = Project.new
        @project.admin_id = params[:admin_id]
        @project.title = params[:title]
        @project.maxMember = params[:maxMember]
        @project.skills = params[:skills]
        @project.description = params[:description]
        @project.isKorean = params[:isKorean]
        @project.isOnline = params[:isOnline]
        @project.tools = params[:tools]
        @project.files = params[:files]
        if @project.save
            input_tag = params[:tags]
            input_tag = input_tag.gsub("\r\n", "\n") # windows에서는 \r\n인데 mac에서는 \n이다.
            tag_array = input_tag.split("\n") 
            tag_array.each do |tag|
                new_tag = Tag.create(project_id: project.id, content: tag)
                project.tags << Tag.find(new_tag.id)
            end

            redirect_to "/#{project.id}"
        else
            redirect_to "/"
        end
        # project = Project.new
        # project.admin_id = params[:admin_id]
        # project.title = params[:title]
        # project.maxMember = params[:maxMember]
        # project.skills = params[:skills]
        # project.description = params[:description]
        # project.isKorean = params[:isKorean]
        # project.isOnline = params[:isOnline]
        # project.tools = params[:tools]
        # project.files = params[:files]
        # project.save

        # input_tag = params[:tags]
        # input_tag = input_tag.gsub("\r\n", "\n") # windows에서는 \r\n인데 mac에서는 \n이다.
        # tag_array = input_tag.split("\n") 
        # tag_array.each do |tag|
        #     new_tag = Tag.create(project_id: project.id, content: tag)
        #     project.tags << Tag.find(new_tag.id)
        # end

        # redirect_to "/#{project.id}"
    end

    def search
        keyword = params[:keyword]
        maxMember = params[:maxMember]
        isKorean = params[:isKorean]
        isOnline = params[:isOnline]
        @results = []

        Project.all.each do |p|
            if p.title.include? keyword or p.admin.name.include? keyword # 왜 or 말고 ||는 안 됨? 
                if p.maxMember <= maxMember.to_i
                    if isKorean and isOnline
                        if p.isKorean.to_s == isKorean and p.isOnline.to_s == isOnline
                            @results.push(p)
                        end
                    elsif isKorean
                        if p.isKorean.to_s == isKorean
                            @results.push(p)
                        end
                    elsif isOnline
                        if p.isOnline.to_s == isOnline
                            @results.push(p)
                        end
                    else
                        @results.push(p)
                    end
                end
            end
        end
    end
    
    def show
        @project = Project.find(params[:id])
    end

    def edit
        @project = Project.find(params[:id])
    end

    def update
        project = Project.find(params[:id])
        project.admin_id = params[:admin_id]
        project.title = params[:title]
        project.maxMember = params[:maxMember]
        project.skills = params[:skills]
        project.description = params[:description]
        project.isKorean = params[:isKorean]
        project.isOnline = params[:isOnline]
        project.tools = params[:tools]
        project.files = params[:files]
        project.isClosed = params[:isClosed]
        project.tags.destroy_all
        input_tag = params[:tags]
        input_tag = input_tag.gsub("\r\n", "\n") # windows에서는 \r\n인데 mac에서는 \n이다.
        tag_array = input_tag.split("\n") 
        tag_array.each do |tag|
            new_tag = Tag.create(project_id: project.id, content: tag)
            project.tags << Tag.find(new_tag.id)
        end
        project.save

        redirect_to "/#{project.id}"
    end

    def destroy
        project = Project.find(params[:id])
        project.destroy

        redirect_to '/'
    end

    def apply
        application_hash = {user_id: current_user.id, project_id: params[:id]}
        application = Application.where(application_hash)
        Application.create(application_hash)
    
        redirect_to "/#{params[:id]}"
    end

    def cancel_apply
        application_hash = {user_id: current_user.id, project_id: params[:id]}
        application = Application.where(application_hash)
        application.destroy_all
        
        redirect_to "/#{params[:id]}"
    end

    def user
        user_id = params[:id]
        @user = User.find(user_id)
        @projects = Project.where(admin_id: user_id)
    end

    def accept
        # add as member
        membership_hash = {user_id: params[:requester_id], project_id: params[:project_id]}
        membership = Membership.where(membership_hash)
        puts membership
        Membership.create(membership_hash)

        # remove from appliers
        application_hash = {user_id: params[:requester_id], project_id: params[:project_id]}
        application = Application.where(application_hash)
        application.destroy_all
    
        redirect_to "/#{params[:project_id]}"
    end

    def decline
        application_hash = {user_id: params[:requester_id], project_id: params[:project_id]}
        application = Application.where(application_hash)
        application.destroy_all

        redirect_to "/#{params[:project_id]}"
    end

    def kick_user
        membership_hash = {user_id: params[:member_id], project_id: params[:project_id]}
        membership = Membership.where(membership_hash)
        membership.destroy_all
        
        redirect_to "/#{params[:project_id]}"
    end
end
  
