class UserInfo < ApplicationRecord
    has_many :educations
    has_many :work_histories
    has_many :career_interest
end
