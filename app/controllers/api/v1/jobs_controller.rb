module Api
  module V1
    class JobsController < ApplicationController
      before_action :set_job, only: [:show, :edit, :update]
      before_action :authenticate_user!

      def index
        @jobs = current_user.jobs
        render json: @jobs
      end

      def show
        render json: @job
      end

      def new
        @job = Job.new
      end

      def edit
      end

      def create
        @job = current_user.jobs.new(job_params)

        if @job.save
          render json: @job, status: :created, location: @job
        else
          render json: @job.errors, status: :unprocessable_entity
        end
      end

      def update
        if @job.update(job_params)
          head :no_content
        else
          render json: @job.errors, status: :unprocessable_entity
        end
      end

      private

        def set_job
          @job = current_user.jobs.find(params[:id])
        end

        def job_params(params)
          params.require(:job).permit(
            :job_name, :start_date, :end_date, :client_id, :rate)
        end

    end
  end
end