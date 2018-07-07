class ProjectsController < ApplicationController
    # def index
    #     puts '=================================='
    #     # @projects = Project.all
    #     render 'index'
    #     # puts response.headers["content_type"]
    # end

    def search
        # 프로젝트 이름으로 검색
        name = params[:name]
        # @result = Project.find_by_name(name) 이렇게 하면 조건을 만족하는 첫 번째 것 하나밖에 가져올 수 없음
        # @results = Project.where(name:name)
        @results = []

        Project.all.each do |p|
            if p.name.include? name # 레일즈 3.1.0부터 include? 대신 in? 써도 된다더니 안 됨!!
                @results.push(p)
            end
        end

        if @results.length == 0
            @results = Project.all # 일치하는 검색 결과가 없을 때 그냥 모든 프로젝트를 다 보여 줌
            # 아무것도 안 보여주는 옵션도 생각해 보기
            # 이 페이지를 새로고침했을 때 메소드가 get이 되어서 오류가 나는 것도 고치기! 한 번 전달된 게 계속 남아 있거나 일치하는 게 없을 때와 같은 상황으로 남아 있으면 좋겠는데 
        end
    end

    # def new
    # end

    # def edit_view
    # end

    # def edit
    # end

    # def detail
    # end

    # def like
    # end

    # def request
    # end

    def accept
    end
end
