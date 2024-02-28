class UserInfo < ApplicationRecord
    has_many :educations
    has_many :work_histories
    has_many :career_interest
    has_one_attached :profile_picture
end
