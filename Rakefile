desc "rake 'release[article_name]'"
task :release, [:title] do |t, args|
  date = Time.now.strftime '%Y-%m-%d'
  ext = '.html.md'
  title = "#{date}-#{args[:title].split(' ').join('-')}#{ext}"

  yml = ['---']
  yml << "title: #{args[:title]}"
  yml << "date: #{date}"
  yml << '---'

  File.open("./source/releases/articles/#{title}", 'w') do |f|
    f.puts(yml.join("\n"))
  end
end

desc 'textlint fot blog'
task :textlint_blog do
  sh './node_modules/.bin/textlint source/blogs/articles/'
end

desc 'textlint'
task :textlint do
  sh './node_modules/.bin/textlint source/'
end
