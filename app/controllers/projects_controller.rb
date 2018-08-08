class ProjectsController < ApplicationController 
    before_action :set_project, only: [:show, :edit, :update, :destroy, :apply, :cancel_apply, :accept, :decline, :kick_user, :like]
    before_action :authenticate_user!, except: [:show, :index, :search]

    def index
        @projects = Project.all
        @projects = Project.page params[:page]
    end  

    def new
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)
        @project.save

        input_tag = @project.tag_string
        input_tag = input_tag.gsub(", ", ",")
        tag_array = input_tag.split(',')
        tag_array.each do |tag|
            new_tag = Tag.create(project_id: @project.id, content: tag)
            @project.tags << new_tag
        end
       
        redirect_to @project
     end

    def search
        # parameters
        @keyword = params[:keyword]
        @maxMember = params[:maxMember].to_i
        @isKorean = params[:isKorean] == "true" if params[:isKorean].present?
        @isOnline = params[:isOnline] == "true" if params[:isOnline].present?
        @admin = params[:admin]
        @isClosed = params[:isClosed] == "1" if !params[:isClosed].nil?
        @tag = params[:tag]
        @skills = []
        @skills.push("%"+params[:skill1]+"%") if !params[:skill1].empty?
        @skills.push("%"+params[:skill2]+"%") if !params[:skill2].empty?
        @skills.push("%"+params[:skill3]+"%") if !params[:skill3].empty?
        @tools = []
        @tools.push("%"+params[:tool1]+"%") if !params[:tool1].empty?
        @tools.push("%"+params[:tool2]+"%") if !params[:tool2].empty?
        @tools.push("%"+params[:tool3]+"%") if !params[:tool3].empty?
        
        @results = Project.all

        # search
        @results = @results.where("maxMember <= ?", @maxMember) if @maxMember.present?
        @results = @results.where(isKorean: @isKorean) unless @isKorean.nil?
        @results = @results.where(isOnline: @isOnline) unless @isOnline.nil?
        @results = @results.joins(:admin).where("name like ?", "%#{@admin}%") if @admin.present?
        @results = @results.where((['skills LIKE ?'] * @skills.size).join(' OR '), *@skills) unless @skills.empty?
        @results = @results.where((['tools LIKE ?'] * @tools.size).join(' OR '), *@tools) unless @tools.empty?
        @results = @results.where(isClosed: @isClosed) if !@isClosed.nil?

        # user can decide whether to AND/OR keyword search results
        if params[:orAnd] == "OR"
            keywordSearch = Project.all.search_keyword(@keyword) if @keyword.present?
            @results = @results | keywordSearch
        else
            @results = @results.search_keyword(@keyword) if @keyword.present?
        end
        # search_keyword: search for projects which include the keyword in [title, description, tags]
        # code @ models/project.rb
    end
    
    def show
    end

    def edit
        check_user
    end

    def update
        @project.update(project_params)

        @project.tags.destroy_all
        input_tag = @project.tag_string
        input_tag = input_tag.gsub(", ", ",") # windows에서는 \r\n인데 mac에서는 \n이다.
        tag_array = input_tag.split(",") 
        tag_array.each do |tag|
            new_tag = Tag.create(project_id: @project.id, content: tag)
            @project.tags << Tag.find(new_tag.id)
        end

        redirect_to @project
    end

    def destroy
        project = Project.find(params[:id])
        project.destroy

        redirect_to root_url
    end

    def apply
        application_hash = {user_id: current_user.id, project_id: params[:id]}
        application = Application.where(application_hash)
        Application.create(application_hash)
    
        redirect_to @project
    end

    def cancel_apply
        application_hash = {user_id: current_user.id, project_id: params[:id]}
        application = Application.where(application_hash)
        application.destroy_all
        
        redirect_to @project
    end

    def user
        user_id = params[:id]
        @user = User.find(user_id)
        @projects = Project.where(admin_id: user_id)
        @projects = Project.page params[:page]
    end

    def accept
        # add as member
        membership_hash = {user_id: params[:requester_id], project_id: params[:id]}
        membership = Membership.where(membership_hash)
        Membership.create(membership_hash)

        # remove from appliers
        application_hash = {user_id: params[:requester_id], project_id: params[:id]}
        application = Application.where(application_hash)
        application.destroy_all
    
        redirect_to @project
    end

    def decline
        application_hash = {user_id: params[:requester_id], project_id: params[:id]}
        application = Application.where(application_hash)
        application.destroy_all

        redirect_to @project
    end

    def kick_user
        membership_hash = {user_id: params[:member_id], project_id: params[:id]}
        membership = Membership.where(membership_hash)
        membership.destroy_all
        
        redirect_to @project
    end

    def like
        project_like_hash = {user_id: current_user.id, project_id: params[:id]}
        like = ProjectLike.where(project_like_hash)
        if like.empty?
            ProjectLike.create(project_like_hash)
        else
            like.destroy_all
        end

        redirect_to @project
    end

    private
        def set_project
            @project = Project.find(params[:id])
        end

        def project_params
            params.require(:project).permit(:admin_id, :title, :maxMember, :skills, :description, :isKorean, :isOnline, :tools, :reference, :isClosed, :tag_string)
        end

        def check_user
            if @project.admin != current_user
                redirect_to new_user_session_path
            end
        end
end 