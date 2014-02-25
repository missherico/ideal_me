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



  IdealData.updateIdealData = function(data, callback){
    $.ajax ({ 
      url : this.urls.update.path + gon.user_id + '/ideal_charts/' + gon.idealchart.id+".json",
      type : this.urls.update.method,
      data : {ideal_chart: data} 
    }).done(callback);
  };

  IdealData.doThis = function(fn){
    fn.apply(IdealData);
    return this;
  };


  // event handler for updating idealchart
  IdealData.doThis(function(){
    var _this = this;

    $("#updateIdeal").on("submit", function(event){
      event.preventDefault();

      var updatedIdealData = {};
      updatedIdealData.health_score = $("#health").val();
      updatedIdealData.social_score = $("#social").val();
      updatedIdealData.intellect_score = $('#intellect').val();
      _this.updateIdealData(updatedIdealData, function(data){
        var chartData = chart.options.data[0].dataPoints;
        var newIdealData = data.ideal_chart;
        console.log(newIdealData);
        chartData[0].y = newIdealData.health_score;
        chartData[1].y  = newIdealData.social_score;
        chartData[2].y  = newIdealData.intellect_score;
        chart.render();
      });


    });    
  });

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