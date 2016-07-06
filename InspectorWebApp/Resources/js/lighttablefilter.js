/*  var LightTableFilter = (function(Arr) {

var _input;
var _inputDate;

function _onInputEvent(e) {
_input = e.target; 
searchTable(_filterText); 
}

function _onInputDateEvent(e) {
_inputDate = e.target;
searchTable(_filterText);  
}

function searchTable(execFuncFilter) {			                                
var table = document.getElementById(_input.getAttribute('data-table'));
			                                
Arr.forEach.call(table.tBodies, function(tbody) {
Arr.forEach.call(tbody.rows, execFuncFilter);
});			                                
}

function _filterText(row) {
var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
var textDate;
var valDate = _inputDate.value.split(" - ");
var startDate = new Date(valDate[0]);
var endDate = new Date(valDate[2]);
var shouldDisplay;
if(textDate[1] == "") {
shouldDisplay = text.indexOf(val) === -1;
}
else
{
if(text==""){
shouldDisplay = textDate >= startDate && textDate <= endDate;
}
}
row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
}

function _filterDate(row) {
var text = row.textContent.toLowerCase();                                            
var date = _input.value.split(" - ");                                            
}

return {
init: function() {
var inputs = document.getElementsByClassName('form-control');
Arr.forEach.call(inputs, function(input) {                                                    
input.oninput = function(event){
_onInputEvent(event,_filterText);
}
});

var inputDates = document.getElementsByClassName('form-control form-dates');
Arr.forEach.call(inputDates, function(input) {
input.onchange = function(event){
_onInputEvent(event,_filterDate);
}
});
}
};
})(Array.prototype);

	                                                                    
document.addEventListener('readystatechange', function() {
if (document.readyState === 'complete') {
LightTableFilter.init();                                            
}
});*/