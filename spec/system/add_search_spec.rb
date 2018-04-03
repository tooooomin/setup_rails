# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Search function', type: :system do
  before do
    ruby_programming_language = create :programming_language, name: 'Ruby'
    @ruby_developer = create :developer,
                             email: 'ruby@example.com',
                             programming_languages: [ruby_programming_language]
  end

  it 'Shows developer list witch is matched programming language that selected' do
    visit ('/developers')
    select 'Ruby', from: 'developers_search_form[programming_language_ids]'
    click_on 'Search'
    expect(page).to have_content(@ruby_developer.email)
  end
end