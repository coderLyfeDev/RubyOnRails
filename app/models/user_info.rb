class UserInfo < ApplicationRecord
    has_many :educations
    has_many :work_histories
    has_many :career_interest
    has_one_attached :profile_picture
    has_many :posts

    def self.search_by_name_with_details(name)
        where("name ILIKE ?", "%#{name}%")
          .includes(:work_histories, :educations)
          .map do |user|
            {
              user_info_id: user.id,
              email: user.email,
              name: user.name,
              work_history_employer_name: user.work_histories.pluck(:employer_name),
              work_history_position: user.work_histories.pluck(:position)
            }
          end
      end

end
