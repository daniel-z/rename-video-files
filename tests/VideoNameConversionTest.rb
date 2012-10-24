require "test/unit"
require "../app/VideoNameConversion"

class VideoNameConversionTest < Test::Unit::TestCase

  def setup
    @videoNameConversionObj   = VideoNameConversion.new;

    @expectedVideoNamesDecimal = [
      "MOV001.MOD" , "MOV002.MOD" , "MOV003.MOD" , "MOV004.MOD" , "MOV005.MOD" ,
      "MOV006.MOD" , "MOV007.MOD" , "MOV008.MOD" , "MOV009.MOD" , "MOV010.MOD" ,
      "MOV011.MOD" , "MOV012.MOD" , "MOV013.MOD" , "MOV014.MOD" , "MOV015.MOD" , 
      "MOV016.MOD" , "MOV017.MOD" , "MOV018.MOD" , "MOV019.MOD" , "MOV020.MOD" ,
      'MOV050.MOD' , 'MOV060.MOD' , 'MOV070.MOD' , 'MOV080.MOD' , 'MOV100.MOD' ,
      'MOV500.MOD' , 'MOV999.MOD'
    ];

    @expectedVideoNamesHexadecimal = [
      "MOV001.MOD" , "MOV002.MOD" , "MOV003.MOD" , "MOV004.MOD" , "MOV005.MOD" ,
      "MOV006.MOD" , "MOV007.MOD" , "MOV008.MOD" , "MOV009.MOD" , "MOV00A.MOD" ,
      "MOV00B.MOD" , "MOV00C.MOD" , "MOV00D.MOD" , "MOV00E.MOD" , "MOV00F.MOD" ,
      "MOV010.MOD" , "MOV011.MOD" , "MOV012.MOD" , "MOV013.MOD" , "MOV014.MOD" ,
      'MOV032.MOD' , 'MOV03C.MOD' , 'MOV046.MOD' , 'MOV050.MOD' , 'MOV064.MOD' ,
      'MOV1F4.MOD' , 'MOV3E7.MOD'
    ];

    @decimalNumbers = [ 
      1 , 2 , 3 , 4 , 5 , 6, 7 , 8, 9, 10 , 11 , 12 , 13, 14, 15, 16, 17, 18, 19, 20,
      50 , 60 , 70 , 80 , 100 , 500 , 999
    ];

    @decimalNumbersWithZeros = [ 
      '001' , '002' , '003' , '004' , '005' , '006' , '007' , '008' , '009' , '010' , '011', '012',
      '013' , '014' , '015' , '016' , '017' , '018' , '019' , '020' , '050' , '060' , '070', '080',
      '100' , '500' , '999'
    ];

    super
  end

  def teardown
    super
  end

  def test_getSerieOfNames
      assert_equal @expectedVideoNamesDecimal[ 0..4 ]   , @videoNameConversionObj.getSerieOfNames( 1 , 5 , 'MOD' );
      assert_equal @expectedVideoNamesDecimal[ 4..9 ]   , @videoNameConversionObj.getSerieOfNames( 5 , 10 , 'MOD' );
      assert_equal @expectedVideoNamesDecimal[ 14..19 ] , @videoNameConversionObj.getSerieOfNames( 15 , 20 , 'MOD' );
      assert_equal @expectedVideoNamesDecimal[ 0..19 ]  , @videoNameConversionObj.getSerieOfNames( 1 , 20 , 'MOD');
  end

  def test_convertHexadecimalNameToDecimal
      @expectedVideoNamesHexadecimal.each_index do |index|
        assert_equal @expectedVideoNamesDecimal[index] , @videoNameConversionObj.convertHexadecimalNameToDecimal( @expectedVideoNamesHexadecimal[index] );
      end
  end

  def test_addingNeededZerosToNumber
    @decimalNumbers.each_index do |index|
      assert_equal @decimalNumbersWithZeros[index] , @videoNameConversionObj.addingNeededZerosToNumber( @decimalNumbers[index] );
    end
  end

  def test_createVideoFileNameFromStringNumber
    @decimalNumbersWithZeros.each_index do |index|
      assert_equal @expectedVideoNamesDecimal[ index ] , @videoNameConversionObj.createVideoFileNameFromStringNumber( @decimalNumbersWithZeros[ index ] , 'MOD' );
    end
  end

  def test_createVideoFileNameFromArrayOfStringNumbers
      assert_equal @expectedVideoNamesDecimal , @videoNameConversionObj.createVideoFileNameFromArrayOfStringNumbers( @decimalNumbersWithZeros , 'MOD' );
  end

end

