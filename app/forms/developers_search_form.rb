class DevelopersSearchForm
  include Virtus.model
  include ActiveModel::Model
  include ActiveRecord::Sanitization::ClassMethods

  attribute :programming_language_id, String

  PARAMS = [:programming_language_id].freeze

  def search
    query = Developer.all
    query = query.includes(:developer_programming_languages).where(developer_programming_languages: { programming_language_id: programming_language_id }) if programming_language_id.present?
    query.order(created_at: :desc)
  end

end