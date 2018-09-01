module JobsHelper
	def options_for_job_sector_select
		JobSector.all.collect {|p| [ p.name, p.id ] }
	end

	def options_for_job_skill_select
	end
end
