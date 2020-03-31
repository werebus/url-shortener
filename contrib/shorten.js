// javascript:
(
  function(){
    function listen() {
      console.log(this.responseText);
    }

    var xhr = new XMLHttpRequest();
    xhr.addEventListener("load", listen);
    xhr.open("POST", "https://exmpl.co/", true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(JSON.stringify({
      "key": "ASecretKey",
      "url": window.location.href
    }));
  }()
)
