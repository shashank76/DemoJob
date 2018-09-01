class Skill < ApplicationRecord
  belongs_to :job_sector
  has_many :jobs, dependent: :destroy

  def to_s
  	"#{title}"
  end
end
