class UserMailer < ApplicationMailer

    def signup_confirmation(user)
    	@user = user
    	mail(:to => @user.email, :subject => "Demo - Account Confirmation")
    end

    def job_apply(applied_job)
        @user = User.find(applied_job.user_id)
        @employer = User.find(applied_job.job.user_id)
        @job = applied_job.job
        mail(:to => @user.email, :subject => "Demo - Job Application Confirmation")
        mail(:to => @employer.email, :subject => "Demo - Job Application Confirmation")
    end

    def schedule_interview(schedule_interview)
        @user = User.find(schedule_interview.user_id)
        @schedule_interview = schedule_interview
        @job = schedule_interview.job
        mail(:to => @user.email, :subject => "Demo - Scheduled Interview Confirmation")
    end
end
