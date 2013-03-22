package common
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   
   public class MicInputLevel extends Sprite
   {
      private var _mcMicSensor:McMicSensor;
      private var _mcSilenceLevelIndicatorColor:MovieClip;
      private var _scrollRect:Rectangle;
      private var _indicatorWidth:Number;
      
      public function MicInputLevel()
      {
         super();
         
         _mcMicSensor = new McMicSensor();
         _mcSilenceLevelIndicatorColor = _mcMicSensor.getChildAt(2) as MovieClip;
         _scrollRect = new Rectangle(0, 0, 0, _mcSilenceLevelIndicatorColor.height);
         
         _mcSilenceLevelIndicatorColor.scrollRect = _scrollRect;
         _indicatorWidth = _mcSilenceLevelIndicatorColor.width;
         
         this.addChild(_mcMicSensor);
         this.width = _mcMicSensor.width;
      }
      
      public function onMicSignal(value:Number):void
      {
         if(value < 0 || value > 100) return;
         _scrollRect.width = (_indicatorWidth / 100) * value;
         _mcSilenceLevelIndicatorColor.scrollRect = _scrollRect;
      }
   }
}