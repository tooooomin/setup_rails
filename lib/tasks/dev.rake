namespace :dev do
  require 'factory_bot_rails'
  require 'faker'

  desc 'Generate args developer records'
  task :generate_data, [:developers_num] => :environment do |_, args|
    set_args(args)

    %w[ruby php java react].each { |name|
      FactoryBot.find_or_create_by(:programming_language, name: name)
    }

    %w[jp vn en].each { |code|
      FactoryBot.find_or_create_by(:language, code: code)
    }

    programming_languages = ProgrammingLanguage.all
    languages = Language.all

    @args[:developers_num].times do
      FactoryBot.create(:developer,
                        programming_languages: [programming_languages[rand(programming_languages.length)]],
                        languages: [languages[rand(languages.length)]])
    end
  end
end

def set_args(args)
  @args = {}
  @args[:developers_num] = (args.developers_num || 100).to_i
end