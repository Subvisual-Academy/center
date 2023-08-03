# The serialization result is the same as above
class UserSerializer
  include Alba::Resource

  attributes :id, :name, :email, :password, :bio, :role, :profile_pic, :created_at, :updated_at
end
