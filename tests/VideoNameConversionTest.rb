require "test/unit"
require "app/VideoNameConversion"

class VideoNameConversionTest < Test::Unit::TestCase

  def setup
    @videoNameConversionObj   = VideoNameConversion.new;

    @videoNames1to20 = [
      "MOV001.MOD" , "MOV002.MOD" , "MOV003.MOD" , "MOV004.MOD" , "MOV005.MOD" ,
      "MOV006.MOD" , "MOV007.MOD" , "MOV008.MOD" , "MOV009.MOD" , "MOV010.MOD" ,
      "MOV011.MOD" , "MOV012.MOD" , "MOV013.MOD" , "MOV014.MOD" , "MOV015.MOD" , 
      "MOV016.MOD" , "MOV017.MOD" , "MOV018.MOD" , "MOV019.MOD" , "MOV020.MOD"
    ];

    super
  end

  def teardown
    super
  end

  def test_getSerieOfNames
      assert_equal @videoNames1to20[ 0..4 ]   , @videoNameConversionObj.getSerieOfNames( 1 , 5 );
      assert_equal @videoNames1to20[ 4..9 ]   , @videoNameConversionObj.getSerieOfNames( 5 , 10 );
      assert_equal @videoNames1to20[ 14..19 ] , @videoNameConversionObj.getSerieOfNames( 15 , 20 );
      assert_equal @videoNames1to20[ 0..19 ]  , @videoNameConversionObj.getSerieOfNames( 1 , 20 );
  end

end

