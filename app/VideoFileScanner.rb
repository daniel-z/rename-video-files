#

class VideoFileScanner

  def getVideoSubDirectories ( videoParentFolder )
    allDirectories = [];
    Dir.chdir( videoParentFolder );
    Dir.glob("[^a-z]").each do |entry|
      if ( File.directory?( entry ) )
        allDirectories.push( entry );
      end
    end
    return allDirectories;
  end

  def getVideosInDirectory ( folder )
    
  end

  def mapAllFilesParentInFolder ()
  end

end
