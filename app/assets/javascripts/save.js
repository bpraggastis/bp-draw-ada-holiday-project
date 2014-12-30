$(function(){


  var saveButton = document.getElementById("save");
  saveButton.addEventListener('click', saveImage);

  function saveImage(){
    var data = canvas.toDataURL();
    console.log(data);
    // window.open(data, '_blank', 'location=0, menubar=0, width=500px, height = 400px, status=0' );
    // request = new XMLHttpRequest();
    //
    // request.onreadystatechange = function(){
    //   if(request.readyState == 4 && request.status == 200){
    //     var response = request.responseText;
    //     window.open(response, '_blank', 'location=0, menubar=0' );
    //
    //   }
    // };
    // var parameters = "uri="+data;
    // request.open('POST', 'pictures/create', true);
    // request.setRequestHeader('Content-type','application/x-www-form-urlencoded');
    // request.send(parameters);

    //
    // $.post({
    //     url: "pictures/create",
    //     data: '{uri: data}',
    //     success: function (result) {
    //       window.alert("success!!");
    //     },
    //     error: function(){
    //       window.alert("something went wrong!");
    //       console.log(data);
    //     }
    //
    //
    //   });
      $.post(
        "pictures/create",
        {
          uri: data
        }, function(){
              window.open('pictures/show_image', '_blank', 'location=0, menubar=0' );
        }

      );

  }
});
