require 'rails_helper'

RSpec.describe DevelopersSearchForm do
  describe '#search' do

    context 'with no param' do
      it 'return all developers' do
        create_list(:developer, 2)

        form = DevelopersSearchForm.new({})
        expect(form.search.size).to eq(2)
      end
    end

    context 'with param' do

      let(:programming_language) { create(:programming_language) }
      let(:language) { create(:language) }

      before do
        create_list(:developer, 2)
      end

      it 'returns developers by programming_language' do
        create :developer, programming_languages: [programming_language]
        form = DevelopersSearchForm.new(programming_language_id: programming_language.id)
        expect(form.search.size).to eq(1)
      end

      it 'return developers by language' do
        create :developer, languages: [language]
        form = DevelopersSearchForm.new(language_id: language.id)
        expect(form.search.size).to eq(1)
      end

      it 'return developers by programming_language and language' do
        create :developer, programming_languages: [programming_language], languages: [language]
        form = DevelopersSearchForm.new(programming_language_id: programming_language.id, language_id: language.id)
        expect(form.search.size).to eq(1)
      end

    end
  end
end