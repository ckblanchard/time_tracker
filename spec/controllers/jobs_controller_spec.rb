require 'spec_helper'

describe JobsController do
  let(:user) { FactoryGirl.create(:user) }
  let(:job) { FactoryGirl.create(:job) }
  let(:invalid_job) { FactoryGirl.create(:invalid_job) }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "populates an array of jobs" do
      get :index
      expect(assigns(:jobs)).to eq([job])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested job to @job" do
      get :show, id: job
      expect(assigns(:job)).to eq(job)
    end

    it "renders the :show template" do
      get :show, id: job
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new job to @job" do
      get :new
      expect(assigns(:job)).to be_a_new(Job)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns requested job to @job" do
      get :edit, id: job
      expect(assigns(:job)).to eq(job)
    end

    it "renders the :edit template" do
      get :edit, id: job
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new job in the database" do
        expect { post :create, job: attributes_for(:job) }.to change(Job, :count).by(1)
      end

      it "redirects to the show for that job" do
        post :create, job: attributes_for(:job)
        expect(response).to redirect_to jobs_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new job to the database" do
        expect { post :create, job: attributes_for(:invalid_job) }.to_not change(Job, :count)
      end

      it "re-renders the :new template" do
        post :create, job: attributes_for(:invalid_job)
        expect(response).to render_template :new
      end
    end
  end

  describe "PUT #update" do
    before :each do
      @job = job
    end

    it "locates the requested job" do
      put :update, id: @job, job: attributes_for(:job)
      expect(assigns(:job)).to eq(@job)
    end

    context "with valid attributes" do
      it "updates @job's attributes" do
        put :update, id: @job, job: attributes_for(:job, job_name: "Totally new job")
        @job.reload
        expect(@job.job_name).to eq("Totally new job")
      end

      it "redirects to the show for that job" do
        put :update, id: @job, job: attributes_for(:job)
        expect(response).to redirect_to @job
      end
    end

    context "with invalid attributes" do
      it "does not update the job in the database" do
        put :update, id: @job, job: attributes_for(:job, job_name: nil)
        @job.reload
        expect(@job.job_name).to_not eq(nil)
      end

      it "re-renders the :edit template" do
        put :update, id: @job, job: attributes_for(:invalid_job)
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @job = job
    end

    it "deletes the job from the database" do
      expect { delete :destroy, id: @job }.to change(Job, :count).by(-1)
    end

    it "redirects to the :index view" do
      delete :destroy, id: @job
      expect(response).to redirect_to jobs_path
    end
  end
end
