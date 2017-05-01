ROOTOPEN = "<background>";
ROOTCLOSE = "</background>";

def addStartTime(year, month, day, hour, minute, second)
  starttime =
  "<starttime>
   <year>#{sprintf("%04d", year)}</year>
   <month>#{sprintf("%02d",month)}</month>
   <day>#{sprintf("%02d",day)}</day>
   <hour>#{sprintf("%02d",hour)}</hour>
   <minute>#{sprintf("%02d",minute)}</minute>
   <second>#{sprintf("%02d",second)}</second>
   </starttime>";
    return starttime;
end

def addStatic(duration, filepath)
  static =
  "<static>
   <duration>#{sprintf("%#0.2f",duration)}</duration>
   <file>#{filepath}</file>
   </static>"
  return static;
end

def addTransition(duration, fromfilename, tofilename)
  transition =
  "<transition>
   <duration>#{sprintf("%#0.2f",duration)}</duration>
   <from>#{fromfilename}</from>
   <to>#{tofilename}</to>
   </transition>"
end

def writeXML(thedoc)
  
  puts "Writing XML file to: #{Dir.getwd()} "
  
  File.open("test.xml",'w'){ |file|
    file.write(thedoc);
  }
end

fileNames = Array.new();
theXMLdoc = "";

unless ARGV.length() == 0

  puts "looking up files at #{ARGV[0]} folder..."
  
begin    
  Dir.new(ARGV[0]).each { |dirItem|      
    unless dirItem == "." or dirItem == ".." 
#      puts dirItem;
      fileNames << ARGV[0]+dirItem;
    end    
  }
  
  theXMLdoc += ROOTOPEN;
  theXMLdoc += "\n";
  theXMLdoc += addStartTime(2016,1,1,00,00,00);
  theXMLdoc += "\n";
  
#  puts theXMLdoc;
  fileNames.each {|fileName|
#    puts fileName;
    theXMLdoc += addStatic(300.0,fileName);
    theXMLdoc += "\n";
  }
  
  theXMLdoc += ROOTCLOSE;
  
  puts theXMLdoc;
  writeXML(theXMLdoc);
  
rescue => theException
  #puts theException.inspect;
  puts theException.message;
  exit(1);
    
end

else
  puts "give the path containing the .jpg file to create the XML from."
end