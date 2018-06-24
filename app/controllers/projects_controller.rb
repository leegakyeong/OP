class ProjectsController < ApplicationController
    def index
        @projects = Project.all
        render 'index'
    end

    def new
        render 'new'
    end

    def create
        name = params[:name]
        description = params[:description]

        project = Project.new
        project.name = name # 여기 왜 name이 노란색으로 표시되지..?
        project.description = description
        project.save

        redirect_to action: 'index'
    end

    def destroy
        project_id = params[:id]
        Project.destroy(project_id)
        redirect_to action: 'index'
    end
end
