class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

    has_many :jobs, dependent: :destroy
    has_many :applied_jobs, dependent: :destroy,class_name: "AppliedJob"
    has_many :scheduled_interviews, dependent: :destroy
end
