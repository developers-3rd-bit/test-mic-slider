package
{
   import common.GainSlider;
   
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class TestVolumeSlider extends Sprite
   {
      private var _gainSlider:GainSlider;
      
      public function TestVolumeSlider()
      {
         super();
         _gainSlider = new GainSlider();
         _gainSlider.addEventListener(GainSlider.SliderEvent, onSlide);
         this.addChild(_gainSlider);
         _gainSlider.gain = 90;
      }
      
      private function onSlide(e:Event):void
      {
         trace ("volume-slider " + _gainSlider.presentVal + " gain " + _gainSlider.gain);
      }
   }
}