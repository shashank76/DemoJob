class CreateAppliedJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :applied_jobs, id: :uuid do |t|
      t.references :user, foreign_key: true, type: :uuid
      t.references :job, foreign_key: true, type: :uuid
      t.float :applicant_exp
      t.float :expected_ctc
      t.integer :notice_period

      t.timestamps
    end
  end
end
