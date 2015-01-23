
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Fun Voyage</title>

    <!-- Bootstrap Core CSS -->
    <!--<link href="css/bootstrap.min.css" rel="stylesheet">-->
	<link  rel="stylesheet" href="<c:url value="css/bootstrap.min.css" />" />
    <!-- Custom CSS -->
    <link href="css/stylish-portfolio.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
      #map-canvas {
        width: 75%;
        height: 500px;
        align:center;
        margin-right:3%;
      }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
    <script src="js/jquery.js"></script>
    <script src="js/BpTspSolver.js"></script>
     <script>
        var directionsDisplay;
        var directionsService = new google.maps.DirectionsService();
        var map;
        var TravelTime = 0;

        function initialize() {
            directionsDisplay = new google.maps.DirectionsRenderer();
            var mapCanvas = document.getElementById('map-canvas');
            var mapOptions = {
                center: new google.maps.LatLng(32, -96.750260),
                zoom: 12,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
            directionsDisplay.setMap(map);
        }
        function mapDraw(index,addArr) {
        	
            var start = addArr[0];
            console.log(addArr[0]);
            var end = addArr[addArr.length - 1];
            var between = [];
			for(var i = 1 ; i < addArr.length - 1 ; i++ )
				{
					between.push ({
						location:addArr[i],
						stopover:true
							});
				}
            var request = {
                origin: start,
                destination: end,
                waypoints: between,
                travelMode: google.maps.TravelMode.DRIVING
            };
            directionsService.route(request, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(response);
                }
            });
        
        }
     
        function estimateTimeTravel(Address, DrawFlag) {
        	
            tsp = new BpTspSolver(map, null);
            for (var i = 0 ; i < Address.length ; i++) {
                tsp.addAddress(Address[i], 1);
            }
 
            tsp.setTravelMode(google.maps.DirectionsTravelMode.DRIVING);
            
           		tsp.solveRoundTrip(function () {

                var order = tsp.getOrder();
                
                console.log(order);
                
                // get the time

                var start = Address[order[1] ];
                var end = Address[order[order.length -1]];
                var waypts = [];
                for (var i = 2; i < order.length - 1; i++) {
                    waypts.push({
                        location: Address[order[i] ],
                        stopover: true
                    });
                }

                var request = {
                    origin: start,
                    destination: end,
                    waypoints: waypts,
                    optimizeWaypoints: true,
                    travelMode: google.maps.TravelMode.DRIVING
                };


                //directionsDisplay = tsp.getGDirections();
                directionsService.route(request, function (response, status) {
                    if (status == google.maps.DirectionsStatus.OK) {
                        if(DrawFlag == 1)
                        directionsDisplay.setDirections(response);
                        var route = response.routes[0];
                        
                        //var summaryPanel = document.getElementById('directions_panel');
                        //summaryPanel.innerHTML = '';
                        // For each route, display summary information.
                        for (var i = 0; i < route.legs.length; i++) {
                            var routeSegment = i + 1;

                            console.log(route.legs[i].start_address + ' to ');
                            console.log(route.legs[i].end_address);
                            console.log(route.legs[i].distance.text);
                            console.log(route.legs[i].duration.value);
                            TravelTime = TravelTime + route.legs[i].duration.value;
                        }
                        console.log("Total time for journey is " + TravelTime / 3600 + "hours");
                    }
                });
               
   
            });  

        }
        google.maps.event.addDomListener(window, 'load', initialize);
        </script>
</head>

<body>

    <!-- Navigation -->
    <a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle"><i class="fa fa-bars"></i></a>
    <nav id="sidebar-wrapper">
        <ul class="sidebar-nav">
            <a id="menu-close" href="#" class="btn btn-light btn-lg pull-right toggle"><i class="fa fa-times"></i></a>
            <li class="sidebar-brand">
                <a href="#top">Start </a>
            </li>
            <li>
                <a href="#top">Home</a>
            </li>
            <li>
                <a href="#about">About</a>
            </li>
            <!--  <li>
                <a href="#services">Services</a>
            </li>
            <li>
                <a href="#portfolio">Portfolio</a>
            </li>-->
            <li>
                <a href="#contact">Contact</a>
            </li>
        </ul>
    </nav>

    <!-- Header -->
    <header id="top" class="header">
        
        <div class="text-vertical-center">
            <h1>Fun Voyage</h1>
            <!--  <h3>Free Bootstrap Themes &amp; Templates</h3>-->
            <input type="text" class="form-control" id="placeTextField" style="margin-left:20%;margin-top:1%;height:40px;width:60%;"placeholder="Hola, Which City do you want to visit ?"
                   name="place">
     
            <br>
            <a href="#about" class="btn btn-dark btn-lg">Explore Places</a>
        </div>
    </header>

    <!-- About -->
    <section id="about" class="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>"Traveling allows you to become so many different versions of yourself"</h2>
                    <p class="lead">We Plan your trip in best possible way to save your money and time </p>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>
    
    <section id="services" class="services bg-primary">
        <div class="container">
            <div  class="row text-center">
                <div class="col-lg-10 col-lg-offset-1">
                    <h2>Select the places you want to visit</h2>
                    <hr class="small">
                    <div id="divToBePopulated" class="row">
                        
                    </div>
                    <!-- /.row (nested) -->
                </div>
                <!-- /.col-lg-10 -->
                <div id="divForTimeAndCost"><input type="text" id="timeTextField"
                                               placeholder="How much time do you have?" class="form-control"
                                               style="margin-left:39%;margin-top:1%;height:40px;width:21%;"/><input
                    type="text" id="costTextField" placeholder="How much money do you have?" class="form-control"
                    style="margin-left:39%;margin-top:1%;height:40px;width:21%;"/><a href="#route" style="margin-top: 2%"
                                                                                     class="btn btn-dark btn-lg"
                                                                                     id="searchOptimumRouteLink">Search
                Optimum Route</a></div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>
    <section>
    	<div class="container">
            <div  class="row text-center">
            	<div class="col-lg-12 text-center">
            		<h2>Your Optimal Route(s) is ready!!</h2>
            	</div>
            </div>
        </div>    
    </section>
   <aside class="callout">
        <div style="margin-left:8%;width:100px;float:left;">
       	<select multiple class="form-control" id="addroutes">
  				
  		</select>
		</div>
       
       <div style="float:right" id="map-canvas"></div>
    </aside>
 

	<footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1 text-center">
                    <h4><strong>HACK UTD</strong>
                    </h4>
                    <p>University Of Texas at Dallas<br>800 West Campbell Road, Richardson, TX 75080</p>
                    <ul class="list-unstyled">
                        <li><i class="fa fa-phone fa-fw"></i> (123) 456-7890</li>
                        <li><i class="fa fa-envelope-o fa-fw"></i>  <a href="mailto:name@example.com">name@example.com</a>
                        </li>
                    </ul>
                    <br>
                    <ul class="list-inline">
                        <li>
                            <a href="#"><i class="fa fa-facebook fa-fw fa-3x"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-twitter fa-fw fa-3x"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-dribbble fa-fw fa-3x"></i></a>
                        </li>
                    </ul>
                    <hr class="small">
                    <p class="text-muted">Copyright &copy; Hack_UTD 2014</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script>
    // Closes the sidebar menu
    $("#menu-close").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });

    // Opens the sidebar menu
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });

    
        // Scrolls to the selected menu item on the page
    $(function() {
    	var images = ["bg0.jpg", "bg1.jpg","bg2.jpg","bg3.jpg","bg4.jpg","bg5.jpg","bg6.jpg"];
    	var cnt = 0;
    	setInterval(function () {
    		//console.log("hi");
    	    cnt == images.length-1 ? cnt = 0 : ++cnt;
    	    var url = "img/"+images[cnt];
    	    
    	    $(".header").css("background-image", "url(" + url + ")");
    	    
    	    //$(".header").css("background-repeat", "no-repeat");
    	    //$(".header").css("background-position", "center center");
    	    //$(".header").css("background-attachment", "scroll");  	   
    	    //$(".header").css("background", background);
    	}, 3000);
    	
    	//setInterval(function() { 
    		//  $('.header img')
    		  //  .fadeOut(1000);
    		  //cnt == images.length-1 ? cnt = 0 : ++cnt;
      	    //var url = "img/"+images[cnt];
      	    
    		  //  $(".header").css("background-image", "url(" + url + ")");
    		 // $('.header img')
  		    //.fadeIn(1000);
  			  
    		//},  3000);
    	//setInterval(function() {
    	//$(".header").animate(1000,function(){ 
    		//cnt == images.length-1 ? cnt = 0 : ++cnt;
       	    //var url = "img/"+images[cnt];
       	    //$(".header").css("background-image", "url(" + url + ")").animate(); 
    	 //});
    	//},  3000);
    	
        $('a[href*=#]:not([href=#])').click(function() {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {
				
                var target = $(this.hash);
                console.log(target);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                if (target.length) {
                    $('html,body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    $("#divToBePopulated").empty();
                    
                    

                    var placesTextFieldValue = jQuery("#placeTextField").val();
                    jQuery.getJSON("/route/Place", {place : decodeURIComponent(placesTextFieldValue)},function(returnedData){
                        if(returnedData) {
                            var len = returnedData.length;
                            if(len>0){
                                for(var i=0;i<len;i++){
                                	var divToAppend = "<div class=\"col-md-3 col-sm-6\"><div class=\"service-item\"><span class=\"fa-stack fa-4x\"><img class=\"fa-stack-2x text-primary\" src=\"" + returnedData[i].imgUrl + "\"/></span><h4><strong>" + returnedData[i].placeName + "</strong></h4><p>" + returnedData[i].address + "</p><input type=\"checkbox\" class=\"checkedPlaces\" value=\"" + returnedData[i].id + "\"/><span style=\"display: none\">" + returnedData[i].rating + "</span><span style=\"display: none\">" + returnedData[i].timeSpent + "</span><span style=\"display: none\">" + returnedData[i].cost + "</span>";
                                    jQuery("#divToBePopulated").append(divToAppend);
                                }
                            }
                        }
                    });
                    return false;
                }
            }
        });
    });
        

    </script>
    
   
 <script>
 var routes=null;
    jQuery("#searchOptimumRouteLink").click(function () {
    	console.log($(this).attr('href').split("#"));
    	var aTargetName=$(this).attr('href').split("#");
    	var sTargetName = aTargetName[aTargetName.length - 1];
        var jqTarget = $("a[name=" + sTargetName + "]");
        var checkedNum = jQuery('input[class="checkedPlaces[]"]:checked').length;
        var sList = "";
        var addressList = new Array();
        
        $("#addroutes" ).empty();
        jQuery('input[type=checkbox]:checked').each(function () {
            sList += jQuery(this).val() + ",";
            addressList.push(jQuery(this).parent().children("p").text());            
            
        });
        estimateTimeTravel(addressList, 0);
		setTimeout(function(){console.log("asdasd");},500);
        console.log("Travellll -" + TravelTime);
        var str = sList.substring(0, sList.length - 1)
        console.log(str);
        var time = jQuery("#timeTextField").val();
        var cost = jQuery("#costTextField").val();
        
        console.log($(this).position());
        jQuery.ajax({
            type: "GET",
            url: "/route/Route",
            data: 'ids=' + str + '&timespent=' + time + '&cost=' + cost,
            success: function (msg) {
            	routes= eval("(" + msg + ')');
            	console.log(routes.length);
            	for(var i=0;i<routes.length;i++){
            		$("#addroutes").append("<option value="+(i)+"> route"+(i+1)+" </option>");
            	}
            	
            	
            	mapDraw(0,routes[0].path);
            	console.log(routes[0].path);
            	
            	
            	
            }
        });
        
        if (jqTarget.length > 0) {
            // animate view to the target
            $('html,body').animate({
                scrollTop: jqTarget.offset().top
            }, 2000);
        }

    });
    
    $("#addroutes" )
    .change(function() {
      var str = "";
      $( "select option:selected" ).each(function() {
        //str += $( this ).text() + " ";
        console.log($(this).val());
        var index=$(this).val();
        //var str=$(this).text();
        //var len =  $(this).text().length-1;
        //var index = str.subString(5,len);
        mapDraw(index,routes[index].path);
        
        estimateTimeTravel(routes[index].path, 1)
      });

    })
    .trigger( "change" );
</script>
    

</body>

</html>
