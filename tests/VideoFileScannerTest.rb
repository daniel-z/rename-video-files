require "test/unit"
require "app/VideoFileScanner"

class VideoFileScannerTest < Test::Unit::TestCase

  def setup
    @rootDirectory         = Dir.pwd;
    @testDirectory         = @rootDirectory        + "/tests/";
    @testSamplesDirectory  = @testDirectory        + "testSamples/";
    @videoSampleFolder1    = @testSamplesDirectory + "sample1/";
    @videoSampleSubFolder1 = @videoSampleFolder1    + "1/";
    @videoSampleSubFolder2 = @videoSampleFolder1    + "2/";
    @videoFileScannerObj   = VideoFileScanner.new;

    @expectedSubDirectories = [ "1" , "2" ];

    @expectedSubFolder1 = [
      "MOV001.MOD" , "MOV002.MOD" , "MOV003.MOD" , "MOV004.MOD" , "MOV005.MOD" ,
      "MOV006.MOD" , "MOV007.MOD" , "MOV008.MOD" , "MOV009.MOD" , "MOV00A.MOD" , 
      "MOV00B.MOD" , "MOV00C.MOD" , "MOV00D.MOD" , "MOV00E.MOD" , "MOV00F.MOD" , 
      "MOV010.MOD" , "MOV011.MOD" , "MOV012.MOD"
    ];

    super
  end

  def teardown
    Dir.chdir( @rootDirectory )
    super
  end

  def test_getVideoSubDirectories
      assert_equal @expectedSubDirectories , @videoFileScannerObj.getVideoSubDirectories(@videoSampleFolder1)
  end
  def test_getVideosInDirectory
      assert_equal @expectedSubFolder1 , @videoFileScannerObj.getVideosInDirectory( @videoSampleSubFolder1 )
  end

  def test_getMapOfVideoFolderAndFiles
  end

end

