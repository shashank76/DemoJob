class Job < ApplicationRecord
  belongs_to :user
  belongs_to :job_sector
  belongs_to :skill
  has_many :applied_jobs, dependent: :destroy,class_name: "AppliedJob"
  has_many :scheduled_interviews, dependent: :destroy
end
