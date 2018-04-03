class DevelopersSearchForm
  include Virtus.model
  include ActiveModel::Model
  include ActiveRecord::Sanitization::ClassMethods

  attribute :programming_language_id, String
  attribute :language_id, String

  PARAMS = [:programming_language_id, :language_id].freeze

  def search
    query = Developer.all.includes(:developer_programming_languages, :programming_languages, :developer_languages, :languages)
    query = query.where(developer_programming_languages: { programming_language_id: programming_language_id }) if programming_language_id.present?
    query = query.where(developer_languages: { language_id: language_id }) if language_id.present?
    query.order(created_at: :desc)
  end

end