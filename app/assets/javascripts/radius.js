$(function(){

var setRadius = function(newRadius){
  if(newRadius<minRad)
    newRadius = minRad;
  else if(newRadius>maxRad)
      newRadius = maxRad;
  radius = newRadius;
  ctx.lineWidth = radius*2;

  $('#radval').html(radius);
};

var minRad = 0.5,
    maxRad = 100,
    defaultRad = 5,
    interval = 5,
    radSpan = document.getElementById('radval'),
    decRad = document.getElementById('decrad'),
    incRad = document.getElementById('incrad');



  decRad.addEventListener('click', function(){
    setRadius(radius-interval);
  })

  incRad.addEventListener('click', function(){
    setRadius(radius+interval);
  })

  setRadius(defaultRad);
  setSwatch({target: document.getElementsByClassName('swatch')[0]});



  // var colors = ['black', 'grey', 'white', 'red','orange','yellow',
  // 'green', 'blue', 'indigo', 'violet'];
  //
  // for(var i=0,n=colors.length;i<n;i++){
  //   var swatch = document.createElement('div');
  //   swatch.className = 'swatch';
  //   swatch.style.backgroundColor = colors[i];
  //   swatch.addEventListener('click', setSwatch);
  //   document.getElementById('colors').appendChild(swatch);
  // }
  //
  // function setColor(color){
  //   ctx.fillStyle = color;
  //   cts.strokeStyle = color;
  //   var active = document.getElementsByClassName('active')[0];
  //   if(active){
  //     active.className = 'swatch';
  //   }
  // }
  //
  // function setSwatch(e){
  //   var swatch = e.target;
  //   setColor(swatch.style.backgroundColor);
  //   swatch.className += ' active'
  // }






})
