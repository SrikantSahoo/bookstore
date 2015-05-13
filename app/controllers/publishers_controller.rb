class PublishersController < ApplicationController
  def new
    @page_title = 'Add Publisher'
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_param)
  if @publisher.save
      flash[:notice] = "Publisher Created"
      redirect_to publishers_path
    else
      render 'new'
    end
  end

  def index
    @publishers = Publisher.all
  end

  def update
    @publisher = Publisher.find(params[:id])
    @publisher.update(publisher_param)
    flash[:notice] = 'Publisher Updated'
    redirect_to publishers_path
  end

  def edit
    @publisher = Publisher.find(params[:id])
  end

  def destroy
    @publisher = Publisher.find(params[:id])
    @publisher.destroy
    flash[:notice] = 'Publisher Removed'
    redirect_to publishers_path
  end
  private
    def publisher_param
    params.require(:publisher).permit(:name)
  end
end
