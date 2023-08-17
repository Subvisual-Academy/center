class AddDefaultPicToExistingUsers < ActiveRecord::Migration[7.0]
  def change
    User.where(profile_pic: nil).each do |user|
      user.profile_pic.attach(io: File.open("#{Rails.root}/app/assets/images/profile.png"), filename: "profile.png", content_type: "image/png")
    end
  end
end
