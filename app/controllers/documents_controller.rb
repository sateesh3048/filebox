class DocumentsController < ApplicationController
  before_action :require_login, except: :shared_document

  def index
    @documents = current_user.documents.with_attached_file
  end

  def new
    @new_document = Document.new
  end

  def create
    @document = current_user.documents.new(file_params)
    if @document.save
      redirect_to documents_path, notice: 'Document saved successfully!'
    else
      @new_document = Document.new
      render :new
    end
  end

  def show
    @document = Document.find(params[:id])
  end

  def shared_document
    @short_url = params[:doc_url]
    @document = Document.find_by(short_url: @short_url)
  end

  def share
    @document = Document.find(params[:id])
    @document = @document.generate_shorten_url
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy if @document
    redirect_to documents_path
  end

  private

  def file_params
    params.require(:document).permit(:title, :description, :file)
  end

  def require_login
    redirect_to home_path and return unless user_signed_in?
  end
end
