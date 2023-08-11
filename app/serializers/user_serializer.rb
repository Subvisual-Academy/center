# The serialization result is the same as above
class UserSerializer
  include Alba::Resource

  attributes :id, :name, :email, :profile_pic, :discord, :company_id, :role, :location, :bio
end
