#

class VideoFileScanner

  def getVideoSubDirectories ( videoParentFolder )
    allDirectories = [];
    firstDirectory = Dir.pwd;

    Dir.chdir( videoParentFolder );
    Dir.glob("[^a-z]").each do |entry|
      if ( File.directory?( entry ) )
        allDirectories.push( entry );
      end
    end

    Dir.chdir( firstDirectory );
    return allDirectories;
  end

  def getVideosInDirectory ( folder )
    
  end

  def mapAllFilesParentInFolder ()
  end

end
