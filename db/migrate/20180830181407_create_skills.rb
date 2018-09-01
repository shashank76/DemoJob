class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills, id: :uuid do |t|
      t.references :job_sector, foreign_key: true, type: :uuid
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
