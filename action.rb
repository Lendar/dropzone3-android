# Dropzone Action Info
# Name: android
# Description: Describes what your action will do.
# Handles: Files
# Creator: Denis Elistratov
# URL: http://yoursite.com
# Events: Clicked, Dragged
# KeyModifiers: Command, Option, Control, Shift
# SkipConfig: No
# RunsSandboxed: Yes
# Version: 1.0
# MinDropzoneVersion: 3.0

def dragged
  # Welcome to the Dropzone 3 API! It helps to know a little Ruby before playing in here.
  # If you haven't coded in Ruby before, there's an excellent introduction at http://www.codecademy.com/tracks/ruby

  # Each meta option at the top of this file is described in detail in the Dropzone API docs at https://github.com/aptonic/dropzone3-actions/blob/master/README.md#dropzone-3-api
  # You can edit these meta options as required to fit your action.
  # You can force a reload of the meta data by clicking the Dropzone status item and pressing Cmd+R

  # This is a Ruby method that gets called when a user drags items onto your action.
  # You can access the received items using the $items global variable e.g.
  puts $items.inspect
  # The above line will list the dropped items in the debug console. You can access this console from the Dropzone settings menu
  # or by pressing Command+Shift+D after clicking the Dropzone status item
  # Printing things to the debug console with puts is a good way to debug your script. 
  # Output printed with puts will be shown in red in the console
  
  # You mostly issue commands to Dropzone to do things like update the status - for example the line below tells Dropzone to show
  # the text "Starting some task" and show a progress bar in the grid. If you drag a file onto this action now you'll see what I mean
  # All the possible $dz methods are described fully in the API docs (linked up above)
  $dz.begin("Copying and compressing...")
  
  # Below line switches the progress display to determinate mode so we can show progress
  $dz.determinate(true)
  
  # Below lines tell Dropzone to update the progress bar display
#  $dz.percent(10)
#  sleep(1)
#  $dz.percent(50)
#  sleep(1)
#  $dz.percent(100)

  for item in $items
    searchPattern = item + '/*.png'
    files = Dir.glob(searchPattern)
    done = 0
    files.sort.each do |src|
      filename = File.basename(src)
      filename.downcase!
      filename.gsub!(/(.*)_(.+dpi)/, 'drawable-\2/\1')
      filename.gsub!(' ', '_')
      filename.gsub!('-', '_')      
      dst = File.dirname(src) + '/' + filename
      puts 'Renaming:'
      puts src
      puts dst
      puts ''
      FileUtils.mkdir_p(File.dirname(dst))
      FileUtils.cp(src, dst)
      system "/usr/local/bin/optipng #{dst}"
      done += 1
      $dz.percent(100 * done / files.count)
    end
  end

  
  # The below line tells Dropzone to end with a notification center notification with the text "Task Complete"
  $dz.finish("Task Complete")
  
  # You should always call $dz.url or $dz.text last in your script. The below $dz.text line places text on the clipboard.
  # If you don't want to place anything on the clipboard you should still call $dz.url(false)
  # $dz.text("Here's some output which will be placed on the clipboard")
  $dz.url(false)
end

#def clicked
#  # This method gets called when a user clicks on your action
#  $dz.finish("You clicked me!")
#  $dz.url(false)
#end
