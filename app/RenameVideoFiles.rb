# Ruby App to rename our video files

require "VideoFileScanner"
require "VideoNameConversion"
require 'fileutils'

@mainDirectory = ARGV[0]+'/' || "./";
videoFileScannerObj    = VideoFileScanner.new;
videoNameConversionObj = VideoNameConversion.new;
mapOfVideoFolderAndFiles = videoFileScannerObj.getMapOfVideoFolderAndFiles( @mainDirectory );

#get the new file names for every folder
@mapOfOldNewFileNames = [];
videoIndexStart = 1;

mapOfVideoFolderAndFiles.each do |folder|

    folderName    = folder['folderName'].to_s;
    videoFiles    = folder['folderContent'];
    videoIndexEnd = videoIndexStart + ( videoFiles.length - 1);
    newNames      = videoNameConversionObj.getSerieOfNames( videoIndexStart , videoIndexEnd , 'mpg' );

    @mapOfOldNewFileNames.push( {
        'folderName' => folder['folderName'],
        'actuaNames'   => folder['folderContent'],
        'newNames'   => newNames
    });

    videoIndexStart += videoFiles.length;
end

def renameFile ( actuaName, newName )
    if ( !actuaName || !newName || !File.file?(actuaName) )
        puts "Please check parameters: actuaName: #{actuaName}, newName #{newName}"
      return false;
    end
    FileUtils.mv( actuaName, newName )
end

def renameAllVideofiles ( path , mapOfFileNames )
    if( !mapOfFileNames || !path )
        return!
    end
    mapOfFileNames.each do |folderData|
        basePath = path + folderData['folderName'] + '/';
        folderData['actuaNames'].each_with_index do |actualName, index|
            newName = folderData['newNames'][index];
            if ( actualName === newName )
                next
            end
            # puts basePath + actualName;
            # puts basePath + newName;
            renameFile( basePath + actualName , basePath + newName );
        end
    end
end

renameAllVideofiles( @mainDirectory , @mapOfOldNewFileNames )
