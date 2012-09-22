require "test/unit"
require "app/VideoFileScanner"

class VideoFileScannerTest < Test::Unit::TestCase
  def initialize
    @videoParentFolder = "testSamples/sample1";
    @videoSubFolder1   = "testSamples/sample1/1";
    @videoSubFolder2   = "testSamples/sample1/2";
    @videoFileScannerObj = VideoFileScanner.new
    super
  end
  
  def setup
    super
  end
  
  def teardown
    super
  end
  
  def test_getFolders
      expected = [ "1" , "2" ];
      assert_equal @videoFileScannerObj.getVideoSubFolders @videoParentFolder, expected
  end

end