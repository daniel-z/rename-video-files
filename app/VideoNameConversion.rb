#

class VideoNameConversion

  def initialize
    @videoPrefix          = 'MOV';
    @videoSuffix          = '';
    @videoExtention       = 'MOD';
    @lengthOfNumberOnName = 3;
  end

  def getSerieOfNames ( rangeStart, rangeEnd )
    videoNames = [];

    ( rangeStart..rangeEnd ).each do |index|
      zeros = '';

      if ( index < 10 )
        zeros = '00' 
      elsif ( index < 100 )
        zeros = '0' 
      end

      videoName = @videoPrefix + zeros + index.to_s() + @videoSuffix + '.' + @videoExtention;
      videoNames.push( videoName );
    end

    return videoNames;
  end

  def convertHexadecimalNameToDecimal( nameToConvert )
    indexOfNumberOnName = @videoPrefix.length;
    numberExtractedFromName = nameToConvert[ indexOfNumberOnName, 3 ];
    numberOnDecimal = numberExtractedFromName.hex();
    
    zeros = '';

    if ( numberOnDecimal < 10 )
      zeros = '00' 
    elsif ( numberOnDecimal < 100 )
      zeros = '0' 
    end

    finalName = @videoPrefix + zeros + numberOnDecimal.to_s() + @videoSuffix + '.' + @videoExtention;

    return finalName;
  end

  def addingNeededZerosToNumber( number )
    
  end

end

