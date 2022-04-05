class Student < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :mobile_no, presence: true, length: { minimum: 10 }
    validates :dob, presence: true
    validates :gender, presence: true
    validates :address, presence: true, length: { minimum: 10 }
    validates :course, presence: true
    validates :languages_known, presence: true
end
