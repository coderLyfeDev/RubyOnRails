class Connected < ApplicationRecord
    belongs_to :user_info

  def self.get_connections(user_info_id)
    where(user_info_id: user_info_id)
      .pluck(:connections, :user_info_id)
      .map do |connections, user_info_id|
        {
          connections: connections,
          user_info_id: user_info_id
        }
      end
  end
end
