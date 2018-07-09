class ProjectsController < ApplicationController
    def new
    end

    def create
        project = Project.new
        project.admin_id = params[:admin_id]
        project.title = params[:title]
        project.maxMember = params[:maxMember]
        project.skills = params[:skills]
        project.description = params[:description]
        project.isKorean = params[:isKorean]
        project.isOnline = params[:isOnline]
        project.tools = params[:tools]
        project.files = params[:files]
        project.tags = params[:tags]
        project.save

        redirect_to "/#{project.id}"
    end
    
    def index
        render 'index'
    end

    def show
        @project = Project.find(params[:id])
    end

    def destroy
        project = Project.find(params[:id])
        project.destroy

        redirect_to '/'
    end
end
