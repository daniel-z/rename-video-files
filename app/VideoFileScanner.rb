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

  def getVideosInDirectory ( directory )
    firstDirectory = Dir.pwd;
    Dir.chdir( directory );
    allVideosOnDirectory = [];
    Dir.glob("MOV0*[0-9A-F].MOD").each do |entry|
      allVideosOnDirectory.push( entry );
    end
  end

  def mapAllFilesParentInFolder ()
  end

end
