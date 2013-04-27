package
{
   import common.PlayTestToneButton;
   
   import flash.display.Sprite;
   
   public class TestPlayTestTone extends Sprite
   {
      private var _playTestToneBtn:PlayTestToneButton;
      
      public function TestPlayTestTone()
      {
         super();
         _playTestToneBtn = new PlayTestToneButton();
         this.addChild(_playTestToneBtn);
      }
   }
}