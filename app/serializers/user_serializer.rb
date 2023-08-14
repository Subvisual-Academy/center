# The serialization result is the same as above
class UserSerializer
  include Alba::Resource

  attributes :id, :name, :email, :role, :base_office, :discord

  attribute :company_name do |resource|
    company = Company.find_by(id: resource.company_id)
    company&.name
  end
  
end
