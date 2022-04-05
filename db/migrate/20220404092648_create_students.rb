class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :mobile_no
      t.date :dob
      t.string :gender
      t.text :address
      t.string :course
      t.string :languages_known, array: true

      t.timestamps
    end
  end
end
