# frozen_string_literal: true

module Admin
  class DevelopersSearchForm
    include Virtus.model
    include ActiveModel::Model
    include ActiveRecord::Sanitization::ClassMethods

    attribute :languages, Array[Integer]
    attribute :programming_languages, Array[Integer]

    PARAMS = [:languages, :programming_languages].freeze

    def search
      query = Developer.all
      if languages.present?
        query = query.where(
                         languages: languages
        )
      end
      query.order(created_at: :desc)
    end
  end
end