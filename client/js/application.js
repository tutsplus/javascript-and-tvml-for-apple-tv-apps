App.onLaunch = function(options) {
  var doc = getDocumentContents("http://localhost:9001/templates/tutorials.tvml", function(xhr) {
    navigationDocument.pushDocument(xhr.responseXML);
  });
}

function getDocumentContents(url, loadCallback) {
  var templateXHR = new XMLHttpRequest();
  templateXHR.responseType = "document";
  templateXHR.addEventListener("load", function() { loadCallback(templateXHR) }, false);
  templateXHR.open("GET", url, true);
  templateXHR.send();
  return templateXHR;
}
