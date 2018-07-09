class ProjectsController < ApplicationController
    def index
        render 'index'
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
    end
end
