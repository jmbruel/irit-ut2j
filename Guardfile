#---------------------------------------------
# Makefile that automatically do the job when files are modified
# need the following gems:
# see Gemfile
# need the following command:
#
# guard start
#
#---------------------------------------------
require 'asciidoctor'
require 'erb'

guard 'shell' do
  watch(/.*\.asc$/) {|m|
    Asciidoctor.render_file(m[0], :in_place => true, :attributes => {
'icons' => true, 'iconsdir' => 'images/icons',
'data-uri' => true,
'numbered' => true,
'imagesdir' => 'images'
})
  }
end

#---------------------------------------------
# refresh Chrome browser
#---------------------------------------------
guard 'livereload' do
  watch(%r{^.+\.(css|js|html)$})
end
