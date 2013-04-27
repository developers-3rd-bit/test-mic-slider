package common
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class GainSlider extends Sprite
   {
      private var _mcSlider:McSlider;
      private var _greyBar:Sprite;
      private var _greenBar:Sprite;
      private var _ball:Sprite;
      private var _notches:Sprite;
      
      private var _presentVal:Number = 0;
      public static const SliderEvent:String = "SliderEvent";
      public static const VERY_LOW:Number = 40;
      public static const LOW:Number = 50;
      public static const MED:Number = 60;
      public static const HIGH:Number = 70;
      public static const VERY_HIGH:Number = 80;
      
      public function GainSlider() 
      {
         _mcSlider = new McSlider();
         _greyBar = _mcSlider.getChildAt(1) as Sprite;
         _greenBar = _mcSlider.getChildAt(3) as Sprite;
         _notches = _mcSlider.getChildAt(4) as Sprite;
         _ball = _mcSlider.getChildAt(5) as Sprite;
         
         _ball.addEventListener(MouseEvent.MOUSE_DOWN, onDrag);
         _greyBar.addEventListener(MouseEvent.MOUSE_DOWN, onBarClick);
         
         _ball.mouseChildren = false;
         _greyBar.mouseChildren = false;
         _greenBar.mouseEnabled = false;
         _greenBar.mouseChildren = false;
         _notches.mouseEnabled = false;
         _notches.mouseChildren = false;
         
         this.addChild(_mcSlider);
         
         _ball.x = _presentVal;
         moveGreenBar(null);
      }
      
      private function onDrag(e:MouseEvent):void 
      {
         _ball.startDrag(false, new Rectangle( -_ball.width / 2, _ball.y, _greyBar.width , 0));
         stage.addEventListener(MouseEvent.MOUSE_MOVE, moveGreenBar);
         stage.addEventListener(MouseEvent.MOUSE_UP, onRelease);
      }
      
      private function onBarClick(e:MouseEvent):void 
      {
         _ball.x = this.mouseX - _ball.width / 2;
         moveGreenBar(null)
         _ball.startDrag(false, new Rectangle( -_ball.width / 2, _ball.y, _greyBar.width , 0));
         stage.addEventListener(MouseEvent.MOUSE_MOVE, moveGreenBar);
         stage.addEventListener(MouseEvent.MOUSE_UP, onRelease);
      }
      
      private function moveGreenBar(e:MouseEvent):void 
      {
         _greenBar.width = _ball.x + _ball.width / 2;
      }
      
      private function onRelease(e:MouseEvent):void 
      {
         stage.removeEventListener(MouseEvent.MOUSE_MOVE, moveGreenBar);
         stage.removeEventListener(MouseEvent.MOUSE_UP, onRelease);
         _ball.stopDrag();
         _presentVal = Math.round(_greenBar.width * 100 / _greyBar.width);
         dispatchEvent(new Event(SliderEvent));
      }
      
      public function set gain(value:Number):void
      {
         var pValue:Number = 0;
         switch (value)
         {
            case VERY_LOW:
               pValue = 0;
               break;
            case LOW:
               pValue = 25;
               break;
            case MED:
               pValue = 50;
               break;
            case HIGH:
               pValue = 75;
               break;
            case VERY_HIGH:
               pValue = 100;
               break;
         }
         
         _presentVal = pValue;
         _ball.x = (_greyBar.width / 100) * pValue - (_ball.width / 2);
         moveGreenBar(null);	
      }
      
      public function get gain():Number
      {
         if (_presentVal < 22)
         {
            return VERY_LOW;
         }
         
         if (_presentVal >= 22 && _presentVal < 40)
         {
            return LOW;
         }
         
         if (_presentVal >= 40 && _presentVal < 60)
         {
            return MED;
         }
         
         if (_presentVal >= 60 && _presentVal < 85)
         {
            return HIGH;
         }
         
         return VERY_HIGH;
      }
      
      public function get presentVal():Number
      {
         return _presentVal;
      }
   }
}