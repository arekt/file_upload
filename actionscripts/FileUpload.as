//http://livedocs.adobe.com/flex/3/langref/flash/net/FileReference.html#includeExamplesSummary

package {
    import bridge.FABridge;
    import flash.display.Sprite;
    import flash.events.*;
    import flash.net.FileFilter;
    import flash.net.FileReference;
    import flash.net.URLRequest;
    import flash.text.TextField; 

    public class FileUpload extends Sprite {
        private var externalBridge:FABridge;
        private var uploadURL:URLRequest;
        public var file:FileReference;
        private var tf:TextField;
        
        public function FileUpload():void {
            externalBridge = new FABridge();
            externalBridge.rootObject = this;
            trace("brigde setup ready "+this.name);
            uploadURL = new URLRequest();
            uploadURL.url = "/pictures";
            file = new FileReference();
            configureListeners(file);
            tf = new TextField();
            tf.text = "File Upload";
            addChild(tf);
            stage.addEventListener(MouseEvent.CLICK, startHandler);
            // stage.addEventListener("Upload", startHandler);
            // file.browse(getTypes());
        }
        private function startHandler(e:MouseEvent):void {
            file.browse(getTypes());
        }
        //public function startBrowse():void {
        //this one is for javascript
        //what a shame you can't use javascript to start browsing
        //    trace('browse');
        //    dispatchEvent(new Event("Upload",this));
        //}

        private function configureListeners(dispatcher:IEventDispatcher):void {
            dispatcher.addEventListener(Event.CANCEL, cancelHandler);
            dispatcher.addEventListener(Event.COMPLETE, completeHandler);
            dispatcher.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
            dispatcher.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            dispatcher.addEventListener(Event.OPEN, openHandler);
            dispatcher.addEventListener(ProgressEvent.PROGRESS, progressHandler);
            dispatcher.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
            dispatcher.addEventListener(Event.SELECT, selectHandler);
            dispatcher.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA,uploadCompleteDataHandler);
        }

        private function getTypes():Array {
            var allTypes:Array = new Array(getImageTypeFilter(), getTextTypeFilter());
            return allTypes;
        }

        private function getImageTypeFilter():FileFilter {
            return new FileFilter("Images (*.jpg, *.jpeg, *.gif, *.png)", "*.jpg;*.jpeg;*.gif;*.png");
        }

        private function getTextTypeFilter():FileFilter {
            return new FileFilter("Text Files (*.txt, *.rtf)", "*.txt;*.rtf");
        }

        private function cancelHandler(event:Event):void {
            trace("cancelHandler: " + event);
        }

        private function completeHandler(event:Event):void {
            trace("completeHandler: " + event);
        }

        private function uploadCompleteDataHandler(event:DataEvent):void {
            trace("uploadCompleteData: " + event);
        }

        private function httpStatusHandler(event:HTTPStatusEvent):void {
            trace("httpStatusHandler: " + event);
        }
        
        private function ioErrorHandler(event:IOErrorEvent):void {
            trace("ioErrorHandler: " + event);
        }

        private function openHandler(event:Event):void {
            trace("openHandler: " + event);
       }

        private function progressHandler(event:ProgressEvent):void {
            trace("progressHandler name=" + file.name + " bytesLoaded=" + event.bytesLoaded + " bytesTotal=" + event.bytesTotal);
        }

        private function securityErrorHandler(event:SecurityErrorEvent):void {
            trace("securityErrorHandler: " + event);
        }

        private function selectHandler(event:Event):void {
            var file:FileReference = FileReference(event.target);
            trace("selectHandler: name=" + file.name + " URL=" + uploadURL.url);
            if (file.size > 10000){
                trace("You should not send files bigger then 10000bytes");
                file.cancel();
            } else {
            file.upload(uploadURL);
            }
        }
    }
}

