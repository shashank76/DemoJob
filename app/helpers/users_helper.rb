module UsersHelper

	def options_for_user_role_select
		[["Organisation",'Organisation'],["Applicant",'Applicant']]
	end

	def options_for_user_gender_select
		[["Male",'male'],["Female",'female']]
	end
end
