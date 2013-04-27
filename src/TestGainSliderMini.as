package
{
   import common.GainSliderMini;
   
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class TestGainSliderMini extends Sprite
   {
      private var _gainSliderMini:GainSliderMini;
      
      public function TestGainSliderMini()
      {
         super();
         
         _gainSliderMini = new GainSliderMini("");
         _gainSliderMini.addEventListener(GainSliderMini.SliderEvent, onSlide);
         this.addChild(_gainSliderMini);
         
         _gainSliderMini.gain = 90;
      }
      
      private function onSlide(e:Event):void
      {
         trace ("volume-slider " + _gainSliderMini.presentVal + " gain " + _gainSliderMini.gain);
      }
   }
}