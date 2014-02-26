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
        chartData[0].y = newIdealData.health_score;
        chartData[1].y  = newIdealData.social_score;
        chartData[2].y  = newIdealData.intellect_score;
        chart.render();
      });


    });    
  });



  var Activity = {};

  Activity.urls ={
    create : { path : "/real_charts/nil/activities.json", method : 'post'}
  };

  Activity.saveActivity = function(activityReal, callback){
    var data = { activity : activityReal };
    $.ajax({
      url : this.urls.create.path,
      type : this.urls.create.method,
      data : data}).done(callback);
  };

  Activity.doThis = function(fn){
    fn.apply(Activity);
    return this;
  };


  Activity.doThis(function(){
    var _this = this;

    var popShift = function(chartData, index, newActivity){
      if (chartData[index].activity.length === 5){
        chartData[index].activity.pop();
      } 
    chartData[index].activity.unshift(newActivity.body);
    };
      

    $("#addActivity").on("submit", function(event){
      event.preventDefault();
      var newActivity = {body: $("#activity_body").val()};
      var selectedVal = "";
      var selected = $("input[type='radio'][name='activity[cateogry_id]']:checked");
      if (selected.length > 0) {
        selectedVal = selected.val();
      }
      newActivity.category_id = selectedVal;
      _this.saveActivity(newActivity, function(data){
        var chartData = chart.options.data[0].dataPoints;
        if (data.activity.category_id === 1){
          popShift(chartData, 1, newActivity);
        } else if (data.activity.category_id === 2) {
          popShift(chartData, 0, newActivity);
        } else {
          popShift(chartData, 2, newActivity);
        }
        chart.render();
      });


    });

  });

  var formatedChartData = function(){
       var dataPoints = [
       {  y: gon.idealchart.health_score, indexLabel: "Health", activity: gon.healthInterests },
       {  y: gon.idealchart.social_score, indexLabel: "Social", activity: gon.socialInterests },
       {  y: gon.idealchart.intellect_score, indexLabel: "Intellect", activity: gon.intellectInterests },
       ];

       $(dataPoints).each(function(index, dataSet){
          dataSet.activity = dataSet.activity.splice(0,5);
          var activities = dataSet.activity;
          
          $(activities).each(function(index, item){
            if(index === 0){
              activities[index] = "<div>"+item;
            } else if (index === activities.length - 1){
              activities[index]= "</div><div>"+item+"</div>";
            } else {
              activities[index] = "</div><div>"+item;
            }
         });
       }); 

       return {
       type: "doughnut",
       toolTipContent: "<div>{activity}</div>",
       dataPoints: dataPoints
        };
      };

  var chart = new CanvasJS.Chart("idealChartContainer",
    {
      title:{
        text: "Ideal Chart"
      },
      data: [formatedChartData()]
   });

    chart.render();
  };