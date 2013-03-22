package common
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	public class VolumeSlider extends Sprite
	{
      private var _mcSlider:McSlider;
		private var _greyBar:Sprite;
		private var _greenBar:Sprite;
		private var _ball:Sprite;
		private var _notches:Sprite;
		
		private var _presentVal:Number = 0;
		
		public function VolumeSlider() 
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
		}
		
		public function get presentVal():Number 
		{
			return _presentVal;
		}
		
		public function set presentVal(val:Number):void 
		{
         if(val < 0 || val > 100) return;
			_presentVal = val;
			_ball.x = (_greyBar.width / 100) * val - (_ball.width / 2);
			moveGreenBar(null);	
		}
		
	}
	
}