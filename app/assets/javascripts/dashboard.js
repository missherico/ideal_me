window.onload = function () {

  
  // instantiate IdealData
  // this will hold all of the functions and data needed to create a chart
  var IdealData = {};

  
  // Creating the urls hash that will be referred to when making ajax requests 
  IdealData.urls = {
    // url to get the IdealChart data
    // /users/:user_id/ideal_charts/:id
    show : { path : '/users/', method : 'get'},
    // url to update the IdealChart data
    // /users/:user_id/ideal_charts/:id
    update : { path : '/users/', method: 'patch'}
  };



  IdealData.getData = function(){
    $.ajax ({
      
    });
  };
};






































}