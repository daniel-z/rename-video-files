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
      completeNumberString = addingNeededZerosToNumber( index );
      videoName = @videoPrefix + completeNumberString.to_s() + @videoSuffix + '.' + @videoExtention;
      videoNames.push( videoName );
    end

    return videoNames;
  end

  def convertHexadecimalNameToDecimal( nameToConvert )
    indexOfNumberOnName = @videoPrefix.length;
    numberExtractedFromName = nameToConvert[ indexOfNumberOnName , 3 ];
    numberOnDecimalFormat = numberExtractedFromName.hex();
    numberOnDecimalFormat = addingNeededZerosToNumber( numberOnDecimalFormat );

    finalName = @videoPrefix + numberOnDecimalFormat.to_s() + @videoSuffix + '.' + @videoExtention;

    return finalName;
  end

  def addingNeededZerosToNumber( number )
    if ( !number ) 
      return;
    end

    neededZeros = '';

    if ( number < 10 )
      neededZeros = '00';
    elsif ( number < 100 )
      neededZeros = '0';
    end

    numberWithZeros = neededZeros + number.to_s();
    return numberWithZeros;
  end

end

