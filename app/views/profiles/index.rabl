collection @profiles
attributes :id, 
           :username,
           :gender, 
           :about_me,
           :body_type,
           :religion,
           :education,
           :children,
           :pets,
           :profile_photo,
           :photo_url, 
           :photo_thumb_url, 
           :height_string,
           :looking_for,
           :interested_in,
           :stars_count
node(:starred) { |profile| profile.stars.any? { |star| star.user_id == current_user.id } }
node(:maybed) { |profile| profile.maybes.any? { |maybe| maybe.user_id == current_user.id && maybe.prefer == true } }
node(:noped) { |profile| profile.maybes.any? { |maybe| maybe.user_id == current_user.id && maybe.prefer == false } }