class CreateScheduledInterviews < ActiveRecord::Migration[5.2]
  def change
    create_table :scheduled_interviews, id: :uuid do |t|
      t.references :user, foreign_key: true, type: :uuid
      t.references :job, foreign_key: true, type: :uuid
      t.datetime :interview_time

      t.timestamps
    end
  end
end
