class UserInfo < ApplicationRecord
    has_many :educations
    has_many :work_histories
end
