require "test/unit"
require "app/VideoFileScanner"

class VideoFileScannerTest < Test::Unit::TestCase

  def setup
    @rootDirectory        = Dir.pwd;
    @testDirectory        = @rootDirectory        + "/tests/";
    @testSamplesDirectory = @testDirectory        + "testSamples/";
    @videoParentFolder    = @testSamplesDirectory + "sample1/";
    @videoSubFolder1      = @videoParentFolder    + "1";
    @videoSubFolder2      = @videoParentFolder    + "2";
    @videoFileScannerObj  = VideoFileScanner.new;
    puts @rootDirectory;
    super
  end

  def teardown
    Dir.chdir( @rootDirectory )
    super
  end

  def test_getVideoSubDirectories
      expected = [ "1" , "2" ];
      assert_equal expected , @videoFileScannerObj.getVideoSubDirectories(@videoParentFolder)
  end
#  def test_getVideosInDirectory
#      expected = [
#        "MOD001.MOD" , "MOD002.MOD" , "MOD003.MOD" , "MOD004.MOD" , "MOD005.MOD" ,
#        "MOD006.MOD" , "MOD007.MOD" , "MOD008.MOD" , "MOD009.MOD" , "MOD00A.MOD" , 
#        "MOD00B.MOD" , "MOD00C.MOD" , "MOD00D.MOD" , "MOD00E.MOD" , "MOD00F.MOD" , 
#        "MOD010.MOD" , "MOD011.MOD" , "MOD012.MOD"
#      ];
#      assert_equal expected , @videoFileScannerObj.getVideosInDirectory(@videoParentFolder)
#  end

end