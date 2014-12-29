radius = 5;

$(function(){

  canvas = document.getElementById("canvas");
  ctx  = canvas.getContext('2d');
  canvas.width = window.innerWidth;
  canvas.height = window.innerHeight;


  var dragging = false;
  ctx.lineWidth = radius*2;


  var putPoint = function(e){
    if(dragging){
      ctx.lineTo(e.clientX, e.clientY);
      ctx.stroke();
      ctx.beginPath();
      ctx.arc(e.clientX, e.clientY, radius, 0, Math.PI*2);
      ctx.fill();
      ctx.beginPath();
      ctx.moveTo(e.clientX, e.clientY);
    }
  };

  var engage = function(e){
    dragging = true;
    putPoint(e);
  };

  var disengage = function(){
    dragging = false;
    ctx.beginPath();
  };



  canvas.addEventListener('mousedown', engage);
  canvas.addEventListener('mousemove', putPoint);
  canvas.addEventListener('mouseup', disengage);
});
