class EntriesController < ApplicationController
  before_action :set_entry_statuses
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @entries = current_user.entries
  end

  def show
  end

  def new
    @entry = Entry.new
    @entry.user_id = current_user.id
  end

  def edit
  end

  def create
    params = entry_params
    @entry = current_user.entries.new(entry_params)
    @entry.start_time = Time.at(params[:start_time].to_i)
    @entry.end_time = Time.at(params[:end_time].to_i)
    @entry.entry_date = Time.at(params[:entry_date].to_i)

    if @entry.save
      redirect_to entries_path, notice: "Entry successfully created."
    else
      render :new, alert: "There was a problem creating your entry. Please try again."
    end
  end

  def update
    if @entry.update(entry_params)
      redirect_to @entry, notice: "Entry successfully updated."
    else
      render :edit, alert: "There was a problem updating your entry. Please try again."
    end
  end

  def destroy
    if @entry.destroy
      redirect_to entries_path, notice: "Entry has been deleted."
    else
      redirect_to @entry, alert: "There was a problem deleting your entry. Please try again."
    end
  end

  private

    def set_entry
      @entry = Entry.find(params[:id])
    end

    def set_entry_statuses
      @statuses = Entry.statuses
    end

    def entry_params
      params.require(:entry).permit(:entry_date, :start_time, :end_time, :total_time, :status, :user_id, :invoice_id, :topic )
    end

end
