package com.appodeal.aneplugin
{
	import flash.external.ExtensionContext;
	
	public class Appodeal
	{
		private var context:ExtensionContext;
		
		public function Appodeal()
		{
			if(!context)
				context = ExtensionContext.createExtensionContext("com.appodeal.aneplugin", null);
		}
		
		public function initAppodeal(appKey:String):void
		{
			context.call("initialize", appKey);
		}
		
		public function showBanner():void
		{
			context.call("showBanner");
		}
	}
}

