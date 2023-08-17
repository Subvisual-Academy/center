class AddDefaultPicToExistingUsers < ActiveRecord::Migration[7.0]
  def change
    User.find_each do |user|
      next if user.profile_pic.attached?

      user.profile_pic.attach(io: File.open("#{Rails.root}/app/assets/images/profile.png"), filename: "profile.png", content_type: "image/png")
    end
  end
end
