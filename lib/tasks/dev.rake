namespace :dev do
  require 'factory_bot_rails'
  require 'faker'

  desc 'Generate 100 developer record'
  task :generate_data, [:developers_num] => :environment do |_, args|
    set_args(args)

    @args[:developers_num].times do

      programming_languages = ProgrammingLanguage.all
      languages = Language.all

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