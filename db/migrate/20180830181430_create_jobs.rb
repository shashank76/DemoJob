class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs, id: :uuid do |t|
      t.string :company_name
      t.string :job_title
      t.string :job_location
      t.string :salary
      t.string :experience
      t.references :user, foreign_key: true, type: :uuid
      t.references :job_sector, foreign_key: true, type: :uuid
      t.references :skill, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
