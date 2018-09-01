class JobsController < ApplicationController
  before_action :require_user
  before_action :find_job, except: [:index, :new,:create,:get_skills,:applied_jobs,:schedule_interview,:schedule_interview_update,:scheduled_interview]
  
  def index
  	if current_user.role.eql?("Applicant")
  		@jobs = Job.all.order("created_at desc").paginate(:page => params[:page], :per_page => 10)
  	else
  		@jobs = current_user.jobs.order("created_at desc").paginate(:page => params[:page], :per_page => 10)
  	end
  end

  def show
  end

  def new
  	@job = Job.new
  	@skills = Skill.all.pluck(:id,:title)
  end

  def create
  	@job = Job.new(job_params)
    if @job.save
      redirect_to root_path
      flash[:notice] = "Job Added successfully."
    else
      flash[:error] = @job.errors.full_messages.first
      redirect_to new_job_path
    end
  end

  def edit
  end

  def apply
  	@applied_job = @job.applied_jobs.new
  end

  def apply_for_job
  	@applied_job = @job.applied_jobs.create(applied_job_params)
  	if @applied_job
  		UserMailer.job_apply(@applied_job).deliver_now
      redirect_to root_path
      flash[:notice] = "You have applied for this job successfully."
    else
      flash[:error] = @job.errors.full_messages.first
      redirect_to root_path
    end
  end

  def applied_jobs
  	if current_user.role.eql?("Applicant")
  		@applied_jobs = AppliedJob.where(user_id: current_user.id).order("created_at desc").paginate(:page => params[:page], :per_page => 10)
  	else
  		@applied_jobs = AppliedJob.where("job_id IN (?)",current_user.jobs.pluck(:id)).order("created_at desc").paginate(:page => params[:page], :per_page => 10)
  	end
  end

  def schedule_interview
  	@job = AppliedJob.find_by(id: params[:id])
  	@schedule_interview = @job.job.scheduled_interviews.new
  end

  def schedule_interview_update
  	@job = AppliedJob.find_by(id: params[:id])
  	@schedule_interview = @job.job.scheduled_interviews.create(scheduled_interview_params)
  	if @schedule_interview
  		UserMailer.schedule_interview(@schedule_interview).deliver_now
      redirect_to applied_jobs_jobs_path
      flash[:notice] = "Interview Scheduled successfully."
    else
      flash[:error] = @job.errors.full_messages.first
      redirect_to applied_jobs_jobs_path
    end
  end

  def scheduled_interview
  	if current_user.role.eql?("Applicant")
  		@interviews = ScheduledInterview.where(user_id: current_user.id).order("created_at desc").paginate(:page => params[:page], :per_page => 10)
  	else
  		@interviews = ScheduledInterview.where("job_id IN (?)",current_user.jobs.pluck(:id)).order("created_at desc").paginate(:page => params[:page], :per_page => 10)
  	end
  end

  def get_skills
  	skills = JobSector.find_by(id: params[:id]).skills.pluck(:id,:title)
    render json: skills
  end

  private
  def find_job
  	@job = Job.find_by(id: params[:id])
  	redirect_to jobs_path unless @job.present?
  end
  def job_params
    params.require(:job).permit(:company_name,:job_title,:job_location,:salary,:experience,:job_sector_id,:skill_id,:user_id)
  end
  def applied_job_params
  	params.require(:applied_job).permit(:applicant_exp,:expected_ctc,:notice_period,:user_id,:job_id)  	
  end
  def scheduled_interview_params  	
  	params.require(:scheduled_interview).permit(:interview_time,:user_id,:job_id)
  end
end
