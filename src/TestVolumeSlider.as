package
{
   import common.VolumeSlider;
   
   import flash.display.Sprite;
   
   public class TestVolumeSlider extends Sprite
   {
      private var _volumeSlider:VolumeSlider;
      
      public function TestVolumeSlider()
      {
         super();
         _volumeSlider = new VolumeSlider();
         this.addChild(_volumeSlider);
         _volumeSlider.presentVal = 60;
      }
   }
}