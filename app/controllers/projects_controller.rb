class ProjectsController < ApplicationController 
    def index
        render 'index'
    end  
   
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

    def search
        keyword = params[:keyword]
        filter = params[:filter]
        @results = []

        Project.all.each do |p|
            case filter
            when 'title'
                if p.title.include? keyword
                    @results.push(p)
                end
            when 'admin'
                if p.admin.id == keyword.to_i
                    @results.push(p)
                end
            else
                @results = Project.all
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
        project.tags = params[:tags]
        project.isClosed = params[:isClosed]
        project.save

        redirect_to "/#{project.id}"
    end

    def destroy
        project = Project.find(params[:id])
        project.destroy

        redirect_to '/'
    end
end
