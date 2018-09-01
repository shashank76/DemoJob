class JobSector < ApplicationRecord
	has_many :skills, dependent: :destroy
	has_many :jobs, dependent: :destroy

	def to_s
		"#{name}"
	end
end
