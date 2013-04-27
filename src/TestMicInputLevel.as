package
{
   import common.MicInputLevel;
   
   import flash.display.Sprite;
   import flash.utils.setTimeout;
   
   public class TestMicInputLevel extends Sprite
   {
      private var _micInputLevel:MicInputLevel;
      private var _delayTime:int = 1000;
      
      public function TestMicInputLevel()
      {
         _micInputLevel = new MicInputLevel();
         this.addChild(_micInputLevel);
         
         setIndicatorLevel();
      }
      
      private function setIndicatorLevel():void
      {
         var randomIndex:int = Math.round(Math.random() * 100);
         trace("mic level is " + randomIndex);
         _micInputLevel.onMicSignal(randomIndex);
         setTimeout(setIndicatorLevel, _delayTime);
      }
   }
}