window.onload = function () {

  
  $('#new_activity').submit(function(){
    $('#first_activity').hide();  
  });

  $('#new_activity').submit(function(){
    $('#realChartContainer').show();  
  });
  
  $('#showAddImageForm').click(function(){
    $('#addImageForm').css({ "display": 'inline'});
    $('#addActivityForm').css({ "display": 'none'});
  });

  $('#showAddActivityForm').click(function(){
    $('#addActivityForm').css({ "display": 'inline'});
    $('#addImageForm').css({ "display": 'none'});
  });


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
        var chartData = chartIdeal.options.data[0].dataPoints;
        var newIdealData = data.ideal_chart;
        chartData[0].y = newIdealData.health_score;
        chartData[1].y  = newIdealData.social_score;
        chartData[2].y  = newIdealData.intellect_score;
        chartIdeal.render();
      });


    });    
  });

  var Interest = {};

  Interest.urls ={
    create : { path : "/real_charts/nil/activities.json", method : 'post'}
  };

  Interest.saveInterest = function(interestIdeal, callback){
    var data = { activity : interestIdeal };
    $.ajax({
      url : this.urls.create.path,
      type : this.urls.create.method,
      data : data}).done(callback);
  };

  Interest.doThis = function(fn){
    fn.apply(Interest);
    return this;
  };


  Interest.doThis(function(){
    var _this = this;

    var popShift = function(chartData, index, newInterest){
      if (chartData[index].activity.length === 5){
        chartData[index].activity.pop();
      } 
    chartData[index].activity.unshift(newInterest.body);
    };
      

    $("#addInterest").on("submit", function(event){
      event.preventDefault();
      var newInterest = {body: $("#interest_body").val()};
      var selectedVal = "";
      var selected = $("input[type='radio'][name='activity[cateogry_id]']:checked");
      if (selected.length > 0) {
        selectedVal = selected.val();
      }
      newInterest.category_id = selectedVal;
      _this.saveInterest(newInterest, function(data){
        var chartData = chartIdeal.options.data[0].dataPoints;
        if (data.activity.category_id === 1){
          popShift(chartData, 1, newInterest);
        } else if (data.activity.category_id === 2) {
          popShift(chartData, 0, newInterest);
        } else {
          popShift(chartData, 2, newInterest);
        }
        chartIdeal.render();
      });
    });

  });

  var dataPointsIdeal = [
    {  y: gon.idealchart.health_score, indexLabel: "Health", activity: gon.idealHealthInterests },
    {  y: gon.idealchart.social_score, indexLabel: "Social", activity: gon.idealSocialInterests },
    {  y: gon.idealchart.intellect_score, indexLabel: "Intellect", activity: gon.idealIntellectInterests }
  ];

  var formatedChartData = function(data){
       var dataPoints = data;

       $(dataPoints).each(function(index, dataSet){
          dataSet.activity = dataSet.activity.splice(0,5);
          var interests = dataSet.activity;
          
          $(interests).each(function(index, item){
            if(index === 0){
              interests[index] = "<div>"+item;
            } else if (index === interests.length - 1){
              interests[index]= "</div><div>"+item+"</div>";
            } else {
              interests[index] = "</div><div>"+item;
            }
         });
       }); 

       return {
       type: "doughnut",
       toolTipContent: "<div>{activity}</div>",
       dataPoints: dataPoints
        };
  };

  var chartIdeal = new CanvasJS.Chart("idealChartContainer",
    {
      title:{
        text: "Ideal Chart"
      },
      data: [formatedChartData(dataPointsIdeal)]
   });

    chartIdeal.render();


  var Activity = {};

  Activity.urls ={
    create : { path : "/real_charts/", method : 'post'}
  };


  Activity.saveActivity = function(activityReal, callback){
    var data = { activity : activityReal };
    $.ajax({
      url : this.urls.create.path + gon.realChart + "/activities.json",
      type : this.urls.create.method,
      data : data}).done(callback);
  };



  Activity.doThis = function(fn){
    fn.apply(Activity);
    return this;
  };


  Activity.doThis(function(){
    var _this = this;

    var popShift = function(chartData, index, newInterest){
      if (chartData[index].activity.length === 5){
        chartData[index].activity.pop();
      } 
    chartData[index].activity.unshift(newInterest.body);
    };
      

    $("#addActivity").on("submit", function(event){
      event.preventDefault();
      var newActivity = {body: $("#activity_body").val()};
      var selectedVal = "";
      var selected = $("input[type='radio'][name='activity']:checked");
      if (selected.length > 0) {
        selectedVal = selected.val();
      }
      newActivity.category_id = selectedVal;
      newActivity.real_chart_id = gon.realChart;
      _this.saveActivity(newActivity, function(data){
        var chartData = chartReal.options.data[0].dataPoints;
        if (data.activity.category_id === 1){
          popShift(chartData, 1, newActivity);
        } else if (data.activity.category_id === 2) {
          popShift(chartData, 0, newActivity);
        } else {
          popShift(chartData, 2, newActivity);
        }
      RealData.updateChart(newActivity);
      });
    });

  });

  var RealData = {};

  RealData.updateChart = function(newActivity){
    var chartData = chartReal.options.data[0].dataPoints;
    if (newActivity.category_id === "1"){
      chartData[1].y += 1;
    } else if (newActivity.category_id === "2"){
      chartData[0].y += 1;
    } else {
      chartData[2].y += 1;
    }

    chartReal.render();
  };    

  var dataPointsReal =[
    {  y: gon.realSocialActivitesCount, indexLabel: "Health", activity: gon.realHealthActivites },
    {  y: gon.realHealthActivitesCount, indexLabel: "Social", activity: gon.realSocialActivites },
    {  y: gon.realIntellectActivitesCount, indexLabel: "Intellect", activity: gon.realIntellectActivites }
  ];

  var chartReal = new CanvasJS.Chart("realChartContainer",
  {
      title:{
        text: "Real Chart"
      },
      data: [formatedChartData(dataPointsReal)]
  });

  chartReal.render();

};