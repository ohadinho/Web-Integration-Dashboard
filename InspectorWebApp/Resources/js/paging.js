(function ($) {
    $(function () {
        $.widget("zpd.paging", {
            options: {
                pagingId: 'paging-navId',
                rowsClass: 'list tr',
                limit: 5,
                limitPaging: 5,
                rowDisplayStyle: 'block',
                activePage: 0,
                rows: []
            },
            _create: function () {
                var rows = $("tbody", this.element).children();
                this.options.rows = rows;
                this.options.rowDisplayStyle = rows.css('display');
                var nav = this._getNavBar();
                this.element.after(nav);
                this.showPage(0);
            },
            _getNavBar: function () {
                var rows = this.options.rows;
                var nav = $('<div>', { id: this.options.pagingId, class: 'paging-nav' });
                this.createLinks(nav, rows);
                return nav;
            },
            createLinks: function (nav, rows) {
                var displayVal;
                for (var i = 0; i < Math.ceil(rows.length / this.options.limit); i++) {
                    displayVal = 'display:inline-block';
                    if (i > this.options.limitPaging)
                        displayVal = 'display:none';

                    this._on($('<a>', {
                        href: '#',
                        text: (i + 1),
                        "data-page": (i),
                        style: displayVal
                    }).appendTo(nav),
                            { click: "pageClickHandler" });

                }
                //create previous link
                this._on($('<a>', {
                    href: '#',
                    text: '<<',
                    "data-direction": -1
                }).prependTo(nav),
                        { click: "pageStepHandler" });
                //create next link
                this._on($('<a>', {
                    href: '#',
                    text: '>>',
                    "data-direction": +1
                }).appendTo(nav),
                        { click: "pageStepHandler" });
            },
            showPage: function (pageNum) {
                var num = pageNum * 1; //it has to be numeric
                this.options.activePage = num;
                var rows = this.options.rows;
                var limit = this.options.limit;
                for (var i = 0; i < rows.length; i++) {
                    if (i >= limit * num && i < limit * (num + 1)) {
                        $(rows[i]).css('display', this.options.rowDisplayStyle);
                    } else {
                        $(rows[i]).css('display', 'none');
                    }
                }
            },
            pageClickHandler: function (event) {
                event.preventDefault();
                $(event.target).siblings().attr('class', "");
                $(event.target).attr('class', "selected-page");
                var pageNum = $(event.target).attr('data-page');
                var itemsOnEachSide = this.options.limitPaging / 2;
                var startPage = Math.floor(parseInt(pageNum) - itemsOnEachSide + 1); // Plus 1 because the array of links starts in "1" index and not "0". "0" index is the next (">>") button 
                var endPage = Math.ceil(parseInt(pageNum) + itemsOnEachSide + 1);
                var pagingLinks = $(event.target).parent().children();
                for (var i = 1; i < pagingLinks.length - 1; i++) {
                    if (i >= startPage && i <= endPage)
                        $(pagingLinks[i]).css('display', 'inline-block');
                    else
                        $(pagingLinks[i]).css('display', 'none');
                }

                this.showPage(pageNum);
            },
            pageStepHandler: function (event) {
                event.preventDefault();
                //get the direction and ensure it's numeric
                var dir = $(event.target).attr('data-direction') * 1;
                var pageNum = this.options.activePage + dir;
                //if we're in limit, trigger the requested pages link
                if (pageNum >= 0 && pageNum < this.options.rows.length) {
                    $("a[data-page=" + pageNum + "]", $(event.target).parent()).click();
                }
            },
            updatePaging: function () {
                this.options.rows = $('.' + this.options.rowsClass).toArray();                
                var nav = $('#' + this.options.pagingId);
                nav.empty();
                this.createLinks(nav, this.options.rows);
                this.showPage(0);

                return nav;
            }
        });
    });
})(jQuery);



