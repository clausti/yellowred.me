collection @profiles
attributes :id, 
           :username,
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
node(:gender) do |profile|
 if profile.gender
    profile.gender
 else
   "gender not specified"
 end
end
node(:starred) { |profile| profile.stars.any? { |star| star.user_id == current_user.id } }
node(:maybed) { |profile| profile.maybes.any? { |maybe| maybe.user_id == current_user.id && maybe.prefer == true } }
node(:noped) { |profile| profile.maybes.any? { |maybe| maybe.user_id == current_user.id && maybe.prefer == false } }