package common
{
   import com.greensock.TweenMax;
   
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class PlayTestToneButton extends Sprite
   {
      private var _mcPlayTestToneBtn:McPlayTestToneBtn;
      private var _bg:Sprite;
      private var _isPlaying:Boolean = false;
      private var _tween:TweenMax;
      
      public function PlayTestToneButton()
      {
         super();
         buttonMode = true;

         _mcPlayTestToneBtn = new McPlayTestToneBtn();
         _mcPlayTestToneBtn.mouseChildren = false;
         
         _bg = _mcPlayTestToneBtn.getChildAt(0) as Sprite;

         addListeners();
         
         this.addChild(_mcPlayTestToneBtn);
      }
      
      private function addListeners():void
      {
         this.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
         this.addEventListener(MouseEvent.ROLL_OVER, onRollOver, false, 0, true);
         this.addEventListener(MouseEvent.ROLL_OUT, onRollOut, false, 0, true);
      }
      
      private function onClick(event:Event):void
      {
         if(_isPlaying)
            _mcPlayTestToneBtn.gotoAndStop(1);
         else
            _mcPlayTestToneBtn.gotoAndStop(2);
         _isPlaying = !_isPlaying;
      }
      
      private function onRollOver(event:Event):void {
         _tween = TweenMax.to(_bg, .2, {colorMatrixFilter:{colorize:0x0000ff, amount:.1}});
      }
      
      private function onRollOut(event:Event):void {
         if(_tween)
            _tween.reverse(false);
      }
      
      public function get isPlaying():Boolean
      {
         return _isPlaying;
      }
      
      public function set enabled(value:Boolean):void 
      {
         if(value) 
         {
            addListeners();
            this.alpha = 1;
         }
         else 
         {
            this.removeEventListener(MouseEvent.CLICK, onClick);
            this.removeEventListener(MouseEvent.ROLL_OVER, onRollOver);
            this.removeEventListener(MouseEvent.ROLL_OUT, onRollOut);
            this.alpha = .5;
         }
         this.buttonMode = value;
      }
   }
}