object @profile
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
           :stars_count
node(:gender) do |profile|
  if profile.gender
     profile.gender
  else
    "gender not specified"
  end
end
node(:looking_for) do |profile| 
  if profile.username == "clausti"
    "A developer job"
  else
    profile.looking_for
  end
end
node(:interested_in) do |profile| 
  if profile.username == "clausti"
    "Front-end development, building sites that are a pleasure to use. Playing with big data sets on the back end. Working with genomic data and lay science. Logistical problems."
  else
    profile.interested_in
  end
end
node(:starred) { |profile| profile.stars.any? { |star| star.user_id == current_user.id } }
node(:maybed) { |profile| profile.maybes.any? { |maybe| maybe.user_id == current_user.id && maybe.prefer == true } }
node(:noped) { |profile| profile.maybes.any? { |maybe| maybe.user_id == current_user.id && maybe.prefer == false } }