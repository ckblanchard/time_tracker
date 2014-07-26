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
  end

  def edit
  end

  def create
    @entry = current_user.entries.new(entry_params)

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
      params.require(:entry).permit(:entry_date, :start_time, :end_time, :total_time, :status, :user_id, :invoice_id )
    end

end
