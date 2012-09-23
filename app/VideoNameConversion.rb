#

class VideoNameConversion

  def getSerieOfNames ( rangeStart, rangeEnd )
    @videoPrefix = 'MOV';
    @videoSuffix = '';
    @videoExtention = 'MOD';
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

end

