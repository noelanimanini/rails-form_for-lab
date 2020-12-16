class SchoolClassesController < ApplicationController
    def index
        @schools = SchoolClass.all
    end

    def show
        @school = SchoolClass.find(params[:id])
    end

    def new 
        @school = SchoolClass.new
    end 

    def create
        @school = SchoolClass.new
        @school.title = params[:school_class][:title]
        @school.room_number = params[:school_class][:room_number]
        @school.save
        redirect_to @school
    end 

    def edit
        @school = SchoolClass.find(params[:id])
        
    end 

    def update
        @school = SchoolClass.find(params[:id])
        
        @school.update(school_params(:title, :room_number))
        redirect_to @school
    end 

    private 

    def school_params(*args)
        params.require(:school_class).permit(*args) 
    end 
end
