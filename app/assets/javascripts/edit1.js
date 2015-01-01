$(function(){
  $(".edit").click(){
    console.log("edit pushed");
    window.open("/");
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.restore();
    img = getElementById("#masterpiece");
    ctx.drawImage(img);


  };
});
