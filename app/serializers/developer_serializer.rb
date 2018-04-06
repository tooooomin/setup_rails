class DeveloperSerializer < ActiveModel::Serializer
  attributes :id, :email

  has_many :programming_languages
  has_many :languages
end