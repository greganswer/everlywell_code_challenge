# frozen_string_literal: true

# Create users

sandi = User.new(
  first_name: 'Sandi',
  last_name: 'Metz',
  website_attributes: {
    url: 'https://www.sandimetz.com/blog'
  }
)
david = User.new(
  first_name: 'David',
  last_name: 'Hansson',
  website_attributes: {
    url: 'https://dhh.dk/'
  }
)
yehuda = User.new(
  first_name: 'Yehuda',
  last_name: 'Katz',
  website_attributes: {
    url: 'https://yehudakatz.com/'
  }
)

[sandi, david, yehuda].each do |user|
  user.website.get_additional_info
  user.save!
end

# Create friendships

friends = [
  {
    user_id: sandi.id,
    friend_id: david.id
  },
  {
    user_id: david.id,
    friend_id: yehuda.id
  },
  {
    user_id: sandi.id,
    friend_id: yehuda.id,
    mutual_friend_id: david.id
  }
]
friends.each do |friendship_params|
  Friendship.create_reciprocal_for_ids(friendship_params)
end
