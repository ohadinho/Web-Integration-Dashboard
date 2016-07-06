// USED ONLY FOR ALL VIEWS

function dataPullInfo(urlVar, dbVar, processNameVar, startDateVar, endDateVar, patientIdVar, firstSuccessFunc, regularSuccessFunc) {
    this.url = urlVar;
    this.db = dbVar;
    this.processName = processNameVar;
    this.startDate = startDateVar;
    this.endDate = endDateVar;
    this.patientId = patientIdVar;
    this.firstSuccessFunc = firstSuccessFunc;
    this.regularSuccessFunc = regularSuccessFunc;
};

function envView(env, spanId, divId, refreshId, spanTableId, tableId, searchId, dateId, dateClass, listOptions, dataPullInfoObj) {
    this.env = env;    
    this.spanId = spanId;
    this.divId = divId;
    this.refreshId = refreshId;
    this.spanTableId = spanTableId;
    this.tableId = tableId;
    this.searchId = searchId;
    this.dateId = dateId;
    this.dateClass = dateClass;
    this.listOptions = listOptions;    
    this.dataPullInfoObj = dataPullInfoObj;    
};

envView.prototype.ajaxCall = function () {

    $.ajax({
        type: "POST",
        url: this.dataPullInfoObj.url,
        data: { env: this.env, db: this.dataPullInfoObj.db, processName: this.dataPullInfoObj.processName, startDate: this.dataPullInfoObj.startDate, endDate: this.dataPullInfoObj.endDate },
        dataType: "json",
        contentType: "application/x-www-form-urlencoded",
        success: this.dataPullInfoObj.regularSuccessFunc
    });
};

envView.prototype.firstAjaxCall = function () {
    if (this.dataPullInfoObj.startDate == '' && this.dataPullInfoObj.endDate == '') {
        this.dataPullInfoObj.startDate = moment().set({ 'hour': 00, 'minute': 00 }).format('YYYY-MM-DD');
        this.dataPullInfoObj.endDate = moment().add(1, 'days').format('YYYY-MM-DD');
    }

    $.ajax({
        type: "POST",
        url: this.dataPullInfoObj.url,
        data: { env: this.env, db: this.dataPullInfoObj.db, processName: this.dataPullInfoObj.processName, startDate: this.dataPullInfoObj.startDate, endDate: this.dataPullInfoObj.endDate },
        dataType: "json",
        contentType: "application/x-www-form-urlencoded",
        success: this.dataPullInfoObj.firstSuccessFunc
    });
};

envView.prototype.pullData = function () {
    this.placeSpinner();
    this.ajaxCall();
};

envView.prototype.firstDataPull = function () {
    this.placeSpinner();
    this.firstAjaxCall();
};

envView.prototype.initDatePicker = function () {
    $('#' + this.dateId).daterangepicker(
             {
                 locale: {
                     format: 'DD-MM-YYYY'
                 },
                 startDate: moment(),
                 endDate: moment().add(1, 'days').set({ 'hour': 00, 'minute': 00 }),
                 minDate: moment().subtract(7, 'days'),
                 maxDate: moment().add(1, 'days').set({ 'hour': 00, 'minute': 00 })
             }, function (start, end, label) {
             }
      )
};

envView.prototype.loadListJS = function () {

    // New list.js object with the options given
    this.list = new List(this.divId, this.listOptions);
};

envView.prototype.loadPaging = function () {
    // Paging.js
    $('#' + this.tableId).paging({ pagingId: 'paging-nav' + this.env, rowsClass: 'list' + this.env + ' tr', limit: 5 });
};

envView.prototype.placeSpinner = function () {
    var spinner = '<br><br><div class="row"><div class="col-lg-6 text-center" style="margin-left:12em"><i class="fa fa-refresh fa-3x fa-spin"></div><div class="col-lg-6 text-center"></div></div>';
    var spanObject = document.getElementById(this.spanTableId);
    spanObject.innerHTML = spinner;
};

envView.prototype.refreshClick = function () {
    var self = this;

    $('#' + self.refreshId).click(
              function () {
                  self.pullData();
                  return false;
              }
          )
};

// USED ONLY FOR ALL VIEWS

// USED ONLY FOR SearchMessageView

envView.prototype.ajaxCallParams = function () {

            $.ajax({
                          type: "POST",
                          url: this.dataPullInfoObj.url,
                          data: { env: this.env, db: this.dataPullInfoObj.db, processName: this.dataPullInfoObj.processName, startDate: this.dataPullInfoObj.startDate, endDate: this.dataPullInfoObj.endDate, patientId: this.dataPullInfoObj.patientId },
                          dataType: "json",
                          contentType: "application/x-www-form-urlencoded",
                          success: this.dataPullInfoObj.regularSuccessFunc
             });
};

envView.prototype.pullDataParams = function () {
    this.placeSpinner();
    this.ajaxCallParams();
};

// USED ONLY FOR SearchMessageView

// SET OPEN MENU (NOT PART OF envView prototype)
function setOpenMenu(currentMenu) {
    // ul
    $("#ulSubMenu" + currentMenu).attr('style', 'overflow: hidden; display: block;');
    // Arrow sign
    $("#spanArrowMenu" + currentMenu).addClass('arrow_carrot-down').removeClass('arrow_carrot-right');

    // Set parents uls
    $("#ulSubMenu" + currentMenu).parents('ul').attr('style', 'overflow: hidden; display: block;');    
}
// SET OPEN MENU (NOT PART OF envView prototype)