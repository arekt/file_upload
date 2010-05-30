var uploadApp;  
var initUploader = function() {
    uploadApp = FABridge.fu.root();
    //uploadApp.getRoot().addEventListener("complete", uploadComplete);
    return true;
    };

$(document).ready(function () {
  $('#fu').flash({ swf: '/FileUpload.swf', flashvars: { bridgeName: 'fu'}, width:60, height:20, wmode: "transparent"});
  FABridge.addInitializationCallback('fu', initUploader );
});


var uploadComplete = function(event) {
    alert("File uploaded successfully");
};
