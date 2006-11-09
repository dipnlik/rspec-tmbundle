class PersonController < ApplicationController

  def index
    @people = Person.find(:all)
    render :template => 'person/list'
  end

  def create
    if request.post?
      @person = Person.create(params[:person])
      unless @person.new_record?
        redirect_to :action => 'index'
      else
        render :template => 'person/create'
      end
    else
      @person = Person.new
      render :template => 'person/create'
    end
  end
  
  def show
    @person = Person.find(params[:id])
    render :template => 'person/show'
  end
  
end