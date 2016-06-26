if(!_global.com)
{
   _global.com=new Object();
}
if(!_global.com.jeroenwijering)
{
   _global.com.jeroenwijering=new Object();
}
if(!_global.com.jeroenwijering.utils)
{
   _global.com.jeroenwijering.utils=new Object();
}
if(!_global.com.jeroenwijering.utils.ImageLoader)
{
   register1=function(tgt, ost, wid, hei)
   {
      this.targetClip=tgt;
      !(arguments.length>1)?null:register0;
      if(arguments.length>2)
      {
            this.targetWidth=wid;
            this.targetHeight=hei;
      }
      this.mcLoader=new MovieClipLoader();
      this.mcLoader.addListener(this);
   };
   com.jeroenwijering.utils.ImageLoader=function(tgt, ost, wid, hei)
   {
      this.targetClip=tgt;
      !(arguments.length>1)?null:register0;
      if(arguments.length>2)
      {
            this.targetWidth=wid;
            this.targetHeight=hei;
      }
      this.mcLoader=new MovieClipLoader();
      this.mcLoader.addListener(this);
   };
   register2=register1.prototype;
   register2.onLoadInit=function(inTarget)
   {
      if(this.useSmoothing=="true")
      {
            register3=new flash.display.BitmapData(this.targetClip.mc._width,this.targetClip.mc._height,true,0);
            register3.draw(this.targetClip.mc);
            register2=this.targetClip.createEmptyMovieClip("smc",this.targetClip.getNextHighestDepth());
            register2.attachBitmap(register3,register2.getNextHighestDepth(),"auto",true);
            this.targetClip.mc.unloadMovie();
            this.targetClip.mc.removeMovieClip();
            delete this.targetClip.mc
            this.scaleImage(this.targetClip.smc);
            this.onLoadFinished();
      }
      else
      {
            this.targetClip.mc.forceSmoothing=true;
            if(this.sourceURL.toLowerCase().indexOf(".swf")==-1)
            {
               this.scaleImage(this.targetClip.mc);
            }
            this.onLoadFinished();
      }
   };
   register2.scaleImage=function(tgt)
   {
      register0=100;
      this.targetClip._yscale=100;
      this.targetClip._xscale=register0;
      register5=tgt._currentframe;
      tgt.gotoAndStop(1);
      this.sourceWidth=tgt._width;
      this.sourceHeight=tgt._height;
      this.sourceLength=tgt._totalframes/20;
      register3=this.targetWidth/this.sourceWidth;
      register4=this.targetHeight/this.sourceHeight;
      if(this.overStretch=="fit"||Math.abs(register3-register4)<0.1)
      {
            tgt._width=this.targetWidth;
            tgt._height=this.targetHeight;
      }
      else
      {
            if(this.overStretch=="true"&&register3>register4||this.overStretch=="false"&&register3<register4)
            {
               register0=register3*100;
               tgt._yscale=register3*100;
               tgt._xscale=register0;
            }
            else
            {
               if(this.overStretch=="none")
               {
                  register0=100;
                  tgt._yscale=100;
                  tgt._xscale=register0;
               }
               else
               {
                  register0=register4*100;
                  tgt._yscale=register4*100;
                  tgt._xscale=register0;
               }
            }
      }
      if(!(this.targetWidth==undefined))
      {
            tgt._x=this.targetWidth/2-tgt._width/2;
            tgt._y=this.targetHeight/2-tgt._height/2;
      }
      tgt.gotoAndPlay(register5);
      this.onMetaData();
   };
   register2.loadImage=function(img)
   {
      this.sourceURL=img;
      this.targetClip.mc.clear();
      this.targetClip.smc.unloadMovie();
      this.targetClip.smc.removeMovieClip();
      delete this.targetClip.smc
      this.checkSmoothing(img);
      register3=this.targetClip.createEmptyMovieClip("mc",1);
      this.mcLoader.loadClip(img,register3);
      if(img.toLowerCase().indexOf(".swf")>-1)
      {
            this.metaInt=setInterval(this,"setSWFMeta",200);
      }
   };
   register2.checkSmoothing=function(img)
   {
      register3=_root._url.indexOf("/",8);
      register4=_root._url.substring(0,register3);
      if(System.capabilities.version.indexOf("7,0,")>-1||img.toLowerCase().indexOf(".swf")>-1||_root._url.indexOf("file://")>-1||img.indexOf(register4)==-1&&img.indexOf("http://")==0)
      {
            this.useSmoothing=false;
      }
      else
      {
            this.useSmoothing=true;
      }
   };
   register2.setSWFMeta=function()
   {
      if(this.targetClip.mc._currentframe>0)
      {
            clearInterval(this.metaInt);
            this.scaleImage(this.targetClip.mc);
      }
   };
   register2.onLoadProgress=function(tgt, btl, btt)
   {
      
   };
   register2.onLoadFinished=function()
   {
      
   };
   register2.onMetaData=function()
   {
      
   };
   register2.overStretch="none";
}