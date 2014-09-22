class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    @jobs = current_user.jobs
    @jobs = Job.filter(params.slice(:client))
  end

  def show
  end

  def new
    @job = Job.new
  end

  def edit
  end

  def create
    @job = current_user.jobs.new(job_params)

    if @job.save
      redirect_to jobs_path, notice: "Job successfully created."
    else
      render action: 'new', alert: "There was a problem creating your job. Please try again."
    end
  end

  def update
    if @job.update(job_params)
      redirect_to @job, notice: "Job successfully updated."
    else
      render action: 'edit', alert: "There was a problem updating your job."
    end
  end

  def destroy
    if @job.destroy
      redirect_to jobs_path, notice: "Your job has been deleted."
    else
      redirect_to @job, alert: "There was a problem deleting your job. Please try again."
    end
  end

  private

    def set_job
      @job = current_user.jobs.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:job_name, :start_date, :end_date, :rate, :client_id)
    end
end
