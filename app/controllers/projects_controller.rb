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
        # keyword = params[:keyword]
        # maxMember = params[:maxMember]
        # isKorean = params[:isKorean]
        # isOnline = params[:isOnline]
        # @results = []

        Project.all.each do |p|
            # keyword = params[:keyword]
            # maxMember = params[:maxMember]
            # isKorean = params[:isKorean]
            # isOnline = params[:isOnline]
            @results = []

            def search_by_title_or_name(p)
                keyword = params[:keyword]
                maxMember = params[:maxMember]

                if p.title.include? keyword or p.admin.name.include? keyword # 왜 or 말고 ||는 안 됨? 
                    if p.maxMember <= maxMember.to_i
                        return true
                    end
                end
            end

            def filter_by_isKorean_and_isOnline(p)
                isKorean = params[:isKorean]
                isOnline = params[:isOnline]

                if isKorean and isOnline
                    if p.isKorean.to_s == isKorean and p.isOnline.to_s == isOnline
                        return true
                    end
                elsif isKorean
                    if p.isKorean.to_s == isKorean
                        return true
                    end
                elsif isOnline
                    if p.isOnline.to_s == isOnline
                        return true
                    end
                else
                    return true
                end
            end

            if search_by_title_or_name(p) and filter_by_isKorean_and_isOnline(p)
                @results.push(p)
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
end
