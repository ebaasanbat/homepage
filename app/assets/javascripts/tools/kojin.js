function doPollAll(){
    $.get('api.php') .done(function(data) {
        //
        var users = ["temuulen", "shimamoto", "kuroda","sangu", "zolboo", "shimose"];
	if(data != ''){
        var obj = jQuery.parseJSON(data);
        }
	else{
	obj = [];
	}

        var output = "";
        $.each(users, function(key, user){
          output = output + user;
          $.each(obj, function(key, val){
            if(key == user){
              output = output + " " + val ;
              $('#'+user+'> span').html(val);
            }

          })

            output = output + '</br>';

        })
        $('#response').html(output);
    }) .always(function(){
      setTimeout(doPollAll, 5000);
    });

}

function doPollDay(user){
  $.get('api.php?date='+user) .done(function(data) {
      // alert(data);  // process results here
      //
      days = {"2":"火", "5":"金"};
      date = data.split(",");
      output = date[0] + "(" + days[date[1]] +")";
      $('.date').html(output);

      // var output = "";
      // $.each(users, function(key, user){
      //   output = output + user;
      //   $.each(obj, function(key, val){
      //     if(key == user){
      //       output = output + " " + val ;
      //       $('#'+user+'> span').html(val);
      //     }
      //
      //   })
      //
      //     output = output + '</br>';

      // })
      // $('#response').html(output);
  }) .always(function(){
    setTimeout(doPollDay, 600000);
  });

}
