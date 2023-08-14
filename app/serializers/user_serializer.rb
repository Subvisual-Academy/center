# The serialization result is the same as above
class UserSerializer
  include Alba::Resource

  attributes :id, :name, :email

  attribute :profile_pic do |resource|
    resource.profile_pic.url
  end

  attribute :company_name do |resource|
    company = Company.find_by(id: resource.company_id)
    company&.name
  end
  
end
