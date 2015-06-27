desc 'Compile HTML from Markdown'
task :compile_markdown do
  github_css = 'http://qucentis.com/files/github.css'
  `pandoc -c #{github_css} -s README.markdown > index.htm`
end

task :default => :compile_markdown
