class RequestsController < ApplicationController


  def new
    @request = Request.new
  end

  def edit
    @request = Request.find request.params["id"]
  end

  def update
    @request = Request.find request.params[:id]
    @request.name = params[:request][:name]
    @request.email = params[:request][:email]
    @request.department = params[:request][:department]
    @request.message = params[:request][:message]
    if @request.save
      redirect_to requests_path
    else
      render :edit
    end
  end

  def show
    @request = Request.find request.params["id"]
  end

  def create

    request_params = params.require(:request).permit([:name, :email, :department, :message])
    @request = Request.new(request_params)
    @request[:status] = "undone"

    if @request.save
      redirect_to requests_path
    else
      render :new
    end

  end

  def index
    @requests = Request.order(status: :desc, name: :asc).limit(7)
  end

  def destroy
    Request.find(params[:id]).destroy
    @requests = Request.order(status: :desc, name: :asc).limit(7)
    redirect_to requests_path
  end

  def done
    @request = Request.find request.params[:id]
    @request.status = "done"
    @request.save
    @requests = Request.order(status: :desc, name: :asc).limit(7)
    redirect_to requests_path
  end

  def undone
    @request = Request.find request.params[:id]
    @request.status = "undone"
    @request.save
    redirect_to requests_path
  end
end
