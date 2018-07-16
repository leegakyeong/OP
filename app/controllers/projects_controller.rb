class ProjectsController < ApplicationController 
    def index
        render 'index'
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
        project.save

        input_tag = params[:tags]
        input_tag = input_tag.gsub("\r\n", "\n") # windows에서는 \r\n인데 mac에서는 \n이다.
        tag_array = input_tag.split("\n") 
        tag_array.each do |tag|
            new_tag = Tag.create(project_id: project.id, content: tag)
            project.tags << Tag.find(new_tag.id)
        end

        redirect_to "/#{project.id}"
    end

    def search
        puts params[:isKorean]
        puts params[:isOnline]
        # keyword = params[:keyword]
        # filter = params[:filter]
        # @results = []

        # Project.all.each do |p|
        #     case filter
        #     when 'title'
        #         if p.title.include? keyword
        #             @results.push(p)
        #         end
        #     when 'admin'
        #         if p.admin.id == keyword.to_i
        #             @results.push(p)
        #         end
        #     else
        #         @results = Project.all
        #     end
        # end
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
end
