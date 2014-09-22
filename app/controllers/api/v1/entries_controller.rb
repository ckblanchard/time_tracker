module Api
  module V1
    class EntriesController < ApplicationController
      before_action :set_entry, only: [:show, :edit, :update, :destroy]
      before_action :authenticate_user!

      def index
        @entries = current_user.entries
        render json: @entries
      end

      def show
        render json: @entry
      end

      def new
        @entry = Entry.new
      end

      def edit
      end

      def create
        @entry = current_user.entries.new(entry_params)

        if @entry.save
          render json: @entry, status: :created, location: @entry
        else
          render json: @entry.errors, status: :unprocessable_entity
        end
      end

      def update
        if @entry.update(entry_params)
          head :no_content
        else
          render json: @entry.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @entry.destroy
        head :no_content
      end

      private

        def set_entry
          @entry = current_user.entries.find(params[:id])
        end

        def entry_params(params)
          params.require(:entry).permit(
            :entry_date, :start_time, :end_time,
            :total_time, :status, :user_id, 
            :invoice_id, :topic_id)
        end

    end
  end
end