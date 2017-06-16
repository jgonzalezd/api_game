p 'Seeding the DB ...'
dictionary_file_path = "#{Rails.root}/db/dictionary.txt"
file_content = File.read(dictionary_file_path)
ValidWord.import [:word], file_content.scan(/(\w+)\n/)
file_content = nil
p 'DB Seeded'
