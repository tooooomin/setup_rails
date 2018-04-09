# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Search function', type: :system do
  before do
    ruby_programming_language = create :programming_language, name: 'ruby'
    en_language = create :language, code: 'en'
    @ruby_developer = create :developer,
                             email: 'ruby@example.com',
                             programming_languages: [ruby_programming_language]
    @ruby_english_developer = create  :developer,
                                      email: 'ruby_english@example.com',
                                      programming_languages: [ruby_programming_language],
                                      languages: [en_language]
  end

  it 'shows developer list witch is matched programming language that selected' do
    visit '/developers'

    select 'ruby', from: 'developers_search_form[programming_language_id]'
    click_on 'Search'

    expect(page).to have_select('developers_search_form[programming_language_id]', selected: 'ruby')
    expect(page).to have_content(@ruby_developer.email)
  end

  it 'shows developer list witch is matched programming language and language that selected' do
    visit '/developers'

    select 'ruby', from: 'developers_search_form[programming_language_id]'
    select 'en', from: 'developers_search_form[language_id]'
    click_on 'Search'

    expect(page).to have_select('developers_search_form[programming_language_id]', selected: 'ruby')
    expect(page).to have_select('developers_search_form[language_id]', selected: 'en')
    expect(page).to have_content(@ruby_english_developer.email)
  end
end
