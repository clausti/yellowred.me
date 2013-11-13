collection @messages
attributes :id, 
           :body,
           :timestamp
node(:sender_username) do |message|
  if message.sender == current_user
    "me"
  else 
    message.sender.profile.username
  end
end 
node(:recipient_username) do |message|
  if message.recipient == current_user
    "me"
  else 
    message.recipient.profile.username
  end
end
node(:photo_url) do |message| 
  if message.sender != current_user 
    message.sender.profile.profile_photo.url(:thumb)
  else 
    message.recipient.profile.profile_photo.url(:thumb)
  end
end