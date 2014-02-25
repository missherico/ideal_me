window.onload = function () {

  
  // instantiate IdealData
  // this will hold all of the functions and data needed to create a chart
  var IdealData = {};

  
  // Creating the urls hash that will be referred to when making ajax requests 
  IdealData.urls = {
    // url to update the IdealChart data
    // /users/:user_id/ideal_charts/:id
    update : { path : '/users/', method: 'patch'}
  };



  IdealData.updateData = function(){
    $.ajax ({ 
      url : this.urls.update.path + gon.user_id + 'ideal_charts/' + gon.idealchart.id,
      type : this.urls.update.method,
      data : data 
    });
  };


  var chart = new CanvasJS.Chart("chartContainer",
    {
      title:{
        text: "Ideal Chart"
      },
      data: [
      {
       type: "doughnut",
       toolTipContent: "{activity}",                
       dataPoints: [
       {  y: gon.idealchart.health_score, indexLabel: "Health", activity: activities },
       {  y: gon.idealchart.social_score, indexLabel: "Social", activity: activities },
       {  y: gon.idealchart.intellect_score, indexLabel: "Intellect", activity: activities },
       ]
     }
     ]
   });

    chart.render();
  };