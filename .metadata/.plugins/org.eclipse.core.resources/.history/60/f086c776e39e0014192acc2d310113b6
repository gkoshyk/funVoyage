<html>
<head>
    <link rel="stylesheet" href="http://utdallas.edu/~george.koshy/bootstrap.min.css">
    <style>
        .form-control {
            max-width: 400px !important
        }
    </style>
<body style="background: url(http://images.psxextreme.com/wallpapers/ps3/seattle_nightlife_926.jpg); background-repeat: no-repeat; background-size: 1368px 662px">
<form class="form-horizontal" action="/" method="post">
    <h1 style="padding-left: 136px">Love Travelling ?!</h1>
    <br/>
    <br/>

    <div class="form-group">
        <label for="placeTextField" class="col-sm-2 control-label">Place</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="placeTextField" placeholder="Hola, Which City do you want to visit ?"
                   name="place">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="button" class="btn btn-primary" id="searchPlacesToVisit" onclick="ajaxCallToShowPlacesToVisit()">Show places to visit</button>
        </div>
    </div>
    <table id="tableToShowAvailablePlaces" class="table table-striped hidden">
        <tr>
            <%-- TODO Table headers of what all you are receiving, the places from the database --%>
        </tr>
    </table>
    <div id="hoursFormGroup" style="display: none">
        <div class="form-group">
            <label for="hoursTextField" class="col-sm-2 control-label">Enter the total time you have </label>

            <div class="col-sm-10">
                <input type="text" class="form-control" id="hoursTextField"
                       placeholder="Enter the  total amount of time you have ?"
                       name="hoursTextField">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="button" class="btn btn-primary" id="hoursButton" onclick="ajaxCallToGetOptimumRoute()">
                    Search Optimum Route
                </button>
            </div>
        </div>
    </div>
    <table id="tableToShowOptimumRoute" class="table table-striped hidden">
        <tr>
           <%-- TODO Table to show optimum route--%>
        </tr>
    </table>
</form>
<%--<h1>${message}</h1>--%>
<script src="http://code.jquery.com/jquery.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function () {
        jQuery("#searchPlacesToVisit").click(function () {

            jQuery("#hoursFormGroup").show();
        })
        jQuery().click(function () {
            //TODO logic to show the json checkboxes
        })
    });
</script>
<script>
    function ajaxCallToShowPlacesToVisit() {
        var placesTextFieldValue = jQuery("#placeTextField").val();
        jQuery.getJSON("/urlToPingForGettingThePlaces", {place : placesTextFieldValue},function(returnedData){
            if(returnedData) {
                var length = Object.keys(returnedData).length;
                var htmlTagsToShowPlacesFromGotJSON = '';
                if(length>0){
                    htmlTagsToShowPlacesFromGotJSON = "<tr>";
                    //TODO generate HTML tags for the json that was received
                }
                if(htmlTagsToShowPlacesFromGotJSON !== null){
                    jQuery("#tableToShowOptimumRoute").append(htmlTagsToShowPlacesFromGotJSON).removeClass("hidden");
                    //TODO change the logic to show the hours check box only when some data is received
                }
            }
            else{
                alert("There aren't any places in our book yet, get back to us soon !");
            }
        })

    }
</script>

<script type="text/javascript">
    function ajaxCallToGetOptimumRoute(){
        var hoursTextFieldValue = jQuery("#hoursTextField").val();
        jQuery.getJSON("/urlToPingForTheGetRequest", {hours : hoursTextFieldValue},function(returnedData){
            //TODO send the selected checkboxes values above
            if(returnedData){
                var length = Object.keys(returnedData).length;
                var htmlTagsToAppendGotFromJSON = '';
                if(length>0){
                    htmlTagsToAppendGotFromJSON = "<tr>";
                    //TODO logic to generate the html tags for the json data that was received
                }
                if(htmlTagsToAppendGotFromJSON !== null){
                    jQuery("#tableToShowAvailablePlaces").append(htmlTagsToAppendGotFromJSON).removeClass("hidden");
                }
            }
            else{
                alert("There is no optimum route for your selection, please try with a different input!");
            }
        })
    }
</script>
</body>
</html>