package
{
   import common.MicInputLevel;
   
   import flash.display.Sprite;
   import flash.utils.setTimeout;
   
   public class TestMicInputLevel extends Sprite
   {
      private var _micInputLevel:MicInputLevel;
      private var _dummyMicLevels:Array = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
      private var _delayTime:int = 1000;
      
      public function TestMicInputLevel()
      {
         _micInputLevel = new MicInputLevel();
         this.addChild(_micInputLevel);
         
         setIndicatorLevel();
      }
      
      private function setIndicatorLevel():void
      {
         var randomIndex:int = Math.round(Math.random() * (_dummyMicLevels.length - 1));
         _micInputLevel.onMicSignal(_dummyMicLevels[randomIndex]);
         setTimeout(setIndicatorLevel, _delayTime);
      }
   }
}