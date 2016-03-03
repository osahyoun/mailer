var exportArray = [];

$(function(){

	$('#sl-container').append("<div id='multiple-button-inputs-sl'></div>");
	$('#multiple-button-inputs-sl').after("<div id='multiple-button-controls'><a class='btn btn-success glyphicon glyphicon-plus' href='javascript:;' id='multiple-add-sl'></a><a class='btn btn-danger glyphicon glyphicon-minus' href='javascript:;' id='multiple-delete-sl'></a></div>");

	$('#pr-container').append("<div id='multiple-button-inputs-pr'></div>");
	$('#multiple-button-inputs-pr').after("<div id='multiple-button-controls'><a class='btn btn-success glyphicon glyphicon-plus' href='javascript:;' id='multiple-add-pr'></a><a class='btn btn-danger glyphicon glyphicon-minus' href='javascript:;' id='multiple-delete-pr'></a></div>");

	$(document).on('click', '#multiple-add-sl', function(event){
			$('#multiple-button-inputs-sl').append("<div class='multiple-button-group'>");
			$('#multiple-button-inputs-sl .multiple-button-group').last().append("<input type='text' class='form-control subjectline' placeholder='Subject Line'/>");
	});

	$(document).on('click', '#multiple-delete-sl', function(event){
			$('#multiple-button-inputs-sl .multiple-button-group').last().remove();
	});

	$(document).on('click', '#multiple-add-pr', function(event){
			$('#multiple-button-inputs-pr').append("<div class='multiple-button-group'>");
			$('#multiple-button-inputs-pr .multiple-button-group').last().append("<input type='text' class='form-control inboxpreview' placeholder='Inbox preview'/>");
	});

	$(document).on('click', '#multiple-delete-pr', function(event){
			$('#multiple-button-inputs-pr .multiple-button-group').last().remove();
	});

	




    function escapeHtml(unsafe) {
	    return unsafe
	         .replace(/</g, "&lt;")
	         .replace(/>/g, "&gt;")
	         .replace(/"/g, "&quot;")
	         .replace(/'/g, "&#039;");
	 }

	function allPossibleCases(arr) {
		  if (arr.length == 1) {
		    return arr[0];
		  } else {
		    var result = [];
		    var allCasesOfRest = allPossibleCases(arr.slice(1));  // recur with the rest of array
		    for (var i = 0; i < allCasesOfRest.length; i++) {
		      for (var j = 0; j < arr[0].length; j++) {
		        result.push("[\""+arr[0][j]+"\",\""+allCasesOfRest[i]+"\"]");
		      }
		    }
		    return result;
		  }

		}

	$('#exporter').click(function(){

		var slArray = [];
		var prArray = [];

		$('.subjectline').each(function(){
			slArray.push(escapeHtml($(this).val()));
		});

		$('.inboxpreview').each(function(){
			prArray.push(escapeHtml($(this).val()));
		});

		exportArray = [];
		exportArray = [slArray, prArray];

		var combinations = allPossibleCases(exportArray);
		console.log(combinations);
		var arrayOutput = combinations.join();
		var slOutput = "{% set s = "+arrayOutput+" %}{{ s[recipient.cons % s|length][0] }}";
		var prOutput = "{% set s = " +arrayOutput+" %}<span style='max-height:0;font-size:0;color:#ffffff ;'>{{ s[recipient.cons % s|length][1] }}</span>";
		$('#exportable-sl').text(slOutput);
		$('#exportable-pr').text(prOutput);

	});


	$('#importer').click(function(){
		var imported = $('#imported-twig').val();
		var strippedStart = imported.replace("{% set s = ", "");
		var strippedEnd = strippedStart.replace(" %}{{ s[recipient.cons % s|length][0] }}", "");
		var importedArray = strippedEnd.split('"],["');
		$(importedArray).each(function(index){
			console.log($(this));
			var removeFront = this.replace('[','');
			var removeBack = removeFront.replace(']','');
			$('#imported-to').append("<div>"+index+" => "+removeBack+"</div>");
		});
	});
});