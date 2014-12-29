$(function(){

var saveButton = document.getElementById("save");

saveButton.addEventListener('click', saveImage);

function saveImage(){
  var data = canvas.toDataURL();
  console.log(data);

  var request = new XMLHttpRequest();

  request.onreadystatechange = function(){
    if(request.readyState == 4 && request.status == 200){
      var response = request.responseText;
      window.open(response, '_blank', 'location=0, menubar=0' );

    }
  };

  request.open('POST', 'app/assets/php/save.php', true);
  request.setRequestHeader('Content-type','application/x-www-form-urlencoded');
  request.send('img='+data);


}


});
