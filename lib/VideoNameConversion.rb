
class VideoNameConversion

  def initialize
    @videoPrefix          = 'MOV';
    @videoSuffix          = '';
    @videoExtention       = 'MOD';
    @lengthOfNumberOnName = 3;
  end

  def getSerieOfNames ( rangeStart, rangeEnd, fileExtention )
    videoNames = [];

    ( rangeStart..rangeEnd ).each do |index|
      completeNumberString = addingNeededZerosToNumber( index );
      videoNames.push( createVideoFileNameFromStringNumber( completeNumberString, fileExtention ) );
    end

    return videoNames;
  end

  def convertHexadecimalNameToDecimal( nameToConvert )
    indexOfNumberOnName = @videoPrefix.length;
    numberExtractedFromName = nameToConvert[ indexOfNumberOnName , @lengthOfNumberOnName ];
    numberOnDecimalFormat = numberExtractedFromName.hex();
    numberOnDecimalFormat = addingNeededZerosToNumber( numberOnDecimalFormat );

    return createVideoFileNameFromStringNumber( numberOnDecimalFormat, @videoExtention );
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

    return neededZeros + number.to_s();
  end

  def createVideoFileNameFromStringNumber( decimalNumberString , videoFileExtention )
    if ( !decimalNumberString )
      return;
    end
    videoExtention = videoFileExtention || @videoExtention;
    return @videoPrefix + decimalNumberString + @videoSuffix + '.' + videoExtention;
  end

  def createVideoFileNameFromArrayOfStringNumbers( arrayOfStringNumbers , videoFileExtention )
    if ( !arrayOfStringNumbers )
      return;
    end

    arrayOfVideoNames = [];

    arrayOfStringNumbers.each do |stringNumber|
      arrayOfVideoNames.push( createVideoFileNameFromStringNumber( stringNumber, videoFileExtention ) );
    end

    return arrayOfVideoNames;
  end
end

