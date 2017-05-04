# mate-background-builder

Hello, mate-background-builder is a simple ruby script to create the .xml file needed by MATE desktop environment in order to use multiple desktop images as a background and add transitions between them.

Usage is as simple as:

  * configure the script (flags will be hopefully added in a future version), mostly 'DURTIME' that is duration time of each picture and 'TRANSTIME' that is the duration of the transition between images, values are in seconds.
  * fire up a terminal
  * change directory to where the ruby script is located.
  * execute 'ruby ./build_background_xml.rb "directory_to_image_files" 

an XML file should have been created and located side-by-side with the ruby script you just executed.
Now, open up MATE desktop's 'Appearance preferences' from 'System -> Preferences -> Look and Feel -> Appearance', click the 'Background' tab, click 'Add...' change the file type to 'All files' and navigate and select the XML file just created by the script. If everyting went ok you should have a background desktop set with multiple files and transitions between them at specified seconds.