class ImportsController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_params, only: [:create]

  def index
    @imports = current_user.imports.all.order(created_at: :desc)
  end

  def create
    import = current_user.imports.new(import_params)
    import.status = :started
    if import.save
      ContactWorker.perform_async(import.id)
      flash[:success] = 'Import created successfully, refresh this page to know the state of the imports'
    else
      error_messages = []
      import.errors.messages.each do |attribute, message|
        error_messages += attribute + message
      end
      flash[:error] = error_messages.join(', ').presence || 'There was an error when starting the imports, try again'
    end
    redirect_to imports_path
  end

  def show
    @import = current_user.imports.includes(:logs).find_by_id(params[:id])
    @logs = @import.logs.order(created_at: :desc)
  end

  private

  def import_params
    params.require(:import).permit(:contacts_file)
  end

  def validate_params
    unless params[:import].present?
      flash[:error] = 'Please upload a file'
      redirect_to imports_path
    end
  end
end
