$(function() {
	$.script = {
		loadSelect: function(json, firstOption, select){
			
			select.find('option').remove();
            $('<option>').val("0").text(firstOption).appendTo(select);
            
            console.log($.applyToJob.response.data);
            
            $.each(json,function(i,obj){
            	$('<option>').val(obj.upazilaId).text(obj.nameEng).appendTo(select);
            });
		},
		E2BNumbers :   {
	            0: '০',
	            1: '১',
	            2: '২',
	            3: '৩',
	            4: '৪',
	            5: '৫',
	            6: '৬',
	            7: '৭',
	            8: '৮',
	            9: '৯'
	        },
	        
        e2b : function(num) {
			var self = this;
            return $.map(num.toString().split(""), function (o) {
                return self.E2BNumbers[o] ? self.E2BNumbers[o] : o
            }).join("");
		}
	};
});



// window
$('.datePicker').attr('readonly', true);
$(".datePicker").css({"background-color": "#fff"});
function finiteFilter(val) {
    return isFinite(val) && val || 0;
}

function getSysDateFormat(date) {
	var d = date.split('/');
	return d[2]+"-"+d[1]+"-"+d[0];
}

function getDateNow() {
	return new Date().toJSON().slice(0,10);
}

function getDateNow() {
	return new Date().toJSON().slice(0,10);
}
function getDateJson(date) {
	var d = date.split('/');
    return {year: d[2], month: d[1], day: d[0]};
}
function getAge(birthDate, ageAtDate) {
    var daysInMonth = 30.436875; // Days in a month on average.
    var dob = new Date(birthDate);
    var aad;
    if (!ageAtDate) aad = new Date();
    else aad = new Date(ageAtDate);
    var yearAad = aad.getFullYear();
    var yearDob = dob.getFullYear();
    var years = yearAad - yearDob; // Get age in years.
    dob.setFullYear(yearAad); // Set birthday for this year.
    var aadMillis = aad.getTime();
    var dobMillis = dob.getTime();
    if (aadMillis < dobMillis) {
        --years;
        dob.setFullYear(yearAad - 1); // Set to previous year's birthday
        dobMillis = dob.getTime();
    }
    var days = (aadMillis - dobMillis) / 86400000;  
    var monthsDec = days / daysInMonth; // Months with remainder.
    var months = Math.floor(monthsDec); // Remove fraction from month.
    days = Math.floor(daysInMonth * (monthsDec - months));
    return {years: years, months: months, days: days};
}

function convertTimeStamp(createdDate) {
    if (createdDate == null)
        return "";
    else
        createdDate = new Date(createdDate);
    var date = createdDate.toLocaleDateString(),
            time = createdDate.toLocaleTimeString();
    date = date.replace(/(\d+)\D(\d+)\D(\d+)/g, '$2/$1/$3');
    time = time.replace(/(.*)\D\d+/, '$1');
    return date + ' ' + time;
}

function getDayByDate(date) {
    var d = new Date(date);
    var weekday = new Array(7);
    weekday[0] = "রবিবার";
    weekday[1] = "সোমবার";
    weekday[2] = "মঙ্গলবার";
    weekday[3] = "বুধবার";
    weekday[4] = "বৃহস্পতিবার";
    weekday[5] = "শুক্রবার";
    weekday[6] = "শনিবার";
    return weekday[d.getDay()];
}

function range(start, stop, step) {
    if (stop == null) {
        stop = start || 0;
        start = 0;
    }
    if (!step) {
        step = stop < start ? -1 : 1;
    }
    var length = Math.max(Math.ceil((stop - start) / step), 0);
    var range = Array(length);

    for (var idx = 0; idx < length; idx++, start += step) {
        range[idx] = start;
    }
    return range;
}

function Calc(data) {
    this.data = data;
    this.sum = data.reduce(function (p, n, i) {
        for (var k in n) {
            p[k] = (p[k] || 0) + (+n[k]);
        }
        ;
        return p
    }, {});
}
Calc.prototype = {
    avg: function (k) {
        return +(this.sum[k] / this.data.length).toFixed(2);
    }
}

// jquery
$(function () {
    // Populate Year and Month dropdown and set current year & month
    /*
	 * var date = new Date(), currentYear = date.getFullYear(), currentMonth =
	 * date.getMonth() + 1; for (var year = currentYear, strYear = ''; year >
	 * 2013; year--) strYear += '<option value=' + year + '>' + year + '</option>';
	 * $('#year').html(strYear);
	 * 
	 * var strMonth = ''; for (var month = 1; month <= 12; month++) { var m =
	 * new Date('2018-' + month + '-01').toLocaleString('us-en', {month:
	 * "long"}); //console.log(m); strMonth += '<option value=' + month + '>' +
	 * m + '</option>'; } $('#month').html(strMonth).val(currentMonth);
	 */
    // End Date month setting

    $.popup = function (url, title, w, h) {
        // window.location.href.split('/').slice(0,-1).concat('/login').join('');
        url = url || "", title = title || "", w = w || 400, h = h || 400;
        // Fixes dual-screen position Most browsers Firefox
        var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
        var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;

        var width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
        var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;

        var left = ((width / 2) - (w / 2)) + dualScreenLeft;
        var top = ((height / 2) - (h / 2)) + dualScreenTop;
        var newWindow = window.open(url, title, 'scrollbars=yes, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);

        // Puts focus on the newWindow
        if (window.focus) {
            newWindow.focus();
        }
        ;
        return newWindow;
    };

    $.isValid = function () {
        var selector = "select#division,select#district,select#upazila,select#union"; // select#unit,select#provCode,
        return $(selector).isValid();
    };
    
    

    $.toast = function (message, type) {
        return function (response) {
            message = response || message;
            toastr[type]("<h4><b>" + message + "</b></h4>");
        };
    };

    $.fn.isValid = function () {
        var valid = true;
        var data = {};
        this.each(function (i, o) {
            var val = +$(o).val();
            if (!val) {
                $.toast("Please select  " + o.id, 'error')();
                return valid = false;
            } else {
                data[o.id + 'id'] = val;
            }
        });
        data = valid ? data : valid;
        return data;
    };

    function Select(data, settings) {
        // data=[ {id: 10, text: ' Helal'}, {id: 10, text: ' Rahen'} ];
        // attrs={id:'id',text:'text'} id & text=>keys for mapping option,
		// value=>selected option id, placeholder=> text of first element
        var defaults = {
            id: 'id',
            text: 'text',
            placeholder: '- select -'
        };

        data = data || [];
        settings = $.extend({}, defaults, settings || {});
        var id = settings.id,
                text = settings.text,
                value = settings.value,
                placeholder = settings.placeholder;
        // console.log(settings);
        var Option = function (item, index) { // item = {id: 10, text: '
												// Helal'}
            // console.log(index, item);
            var html = '<option value="' + (item.id || '') + '" ' + (item.Selected ? 'selected' : '') + ' >' + item.text + '</option>';
            return html;
        };
        var Format = function (item, index) {
            // console.log(item,index);
            return  item.text + (item.id && (item.id != item.text) ? ' [' + item.id + ']' : '');
        };

        var options = [];
        $.each(data, function (index, item) {
            var _id = $.isFunction(id) ? id.call(item, index) : item[id];
            var _text = $.isFunction(text) ? text.call(item, index) : (item[text] || item);
            if (!$.isFunction(text)) {
                _text = Format({id: _id, text: _text}, index);
            }
            var _selected = (!!value && _id == value);
            options.push(Option({id: _id, text: _text, selected: _selected}, index));
        });
        if (placeholder != null) {
            options.unshift(Option({text: placeholder}));
        }
        return options.join('\n');
    }

    $.fn.Select = function () {
        var args = [].slice.call(arguments);
        args[0] = args[0] || [];
        // console.log.apply(console,args);
        return this.each(function (i, o) {
            if ($.type(args[0]) == 'array') {
                var html = Select.apply(o, args);
                return $(o).html(html);
            }

            var fn = $.type(args[0]) == 'string' ? 'get' : 'ajax';
            var xhr = $[fn].call($, args[0]);
            xhr.done(function (response) {
                var data = $.parseJSON(response) || [];
                args[0] = data;
                var html = Select.apply(o, args);
                $(o).html(html);
                $(o).trigger('select', [data]);
            });

        });
    };

    var converterText = function (response) {
        try {
            $.parseJSON(response);
            return response;
        } catch (e) {
            if (response) {
                if ($(response).find('form[name=loginForm]').length) {
                    $.toast('Session time out. <br>Please login firs', 'error')();
                }
            } else {
                $.toast('No data found', 'error')();
            }
            throw new Error("Invalid JSON response");
        }
    };
    $.ajaxSetup({
        converters: {"text html": converterText},
        beforeSend: function () {
            console.log('ajax: Started');
        },
        complete: function () {
            console.log('ajax: Completed');
        },
        success: function () {
            console.log('ajax: Success');
        },
        error: function () {
            console.log('ajax: Error');
        }
    });


    $.fn.dataTable && $.extend($.fn.dataTable.defaults, {responsive: true, autoWidth: true});

});






$(function () {

    $.apps = {
        version: '1.1.0',
        getVersion: function (version) {
            version = ((arguments.length ? version : this.version) || '').toString();
            return $.extend([0, 0, 0], (version || '').match(/\d+/g)).join('.');
        },
        hasVersion: function (version) {
            version = ((arguments.length ? version : this.version) || '').toString();
            return /^(\d+)(\.\d+)?(\.\d+)?$/.test(version);
        },
        months: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
        date: function (xdate) {
            var d = xdate ? new Date(xdate) : new Date();
            var date = d.toLocaleDateString();
            var time = d.toLocaleTimeString();
            var dayDiff = +((new Date() - d) / (24 * 60 * 60 * 1000)).toFixed(2);
            var year = d.getFullYear();
            var month = d.getMonth();
            var day = d.getDate();
            date = date.replace(/(\d+)\D(\d+)\D(\d+)/g, '$2/$1/$3');
            time = time.replace(/(.*)\D\d+/, '$1');

            return {
                year: year,
                month: month + 1,
                day: day,
                date: date,
                time: time,
                datetime: date + '  ' + time,
                datetimeHuman: day + '  ' + $.app.months[month] + ', ' + year + '  ' + time,
                dayDiff: dayDiff
            }
        },
        ajax: function (options) {
            var defaults = {};
            options = $.extend({}, defaults, options || {});
            var xhr = $.ajax(options);
            return xhr;
        },
        pairs: function (serializeArray) {
            return serializeArray.reduce(function (p, n) {
                p[n.name] = n.value;
                return p;
            }, {});
        },
        workplanStatus: {
            submitted: '<div class="callout callout-success" style="margin-bottom: 0!important;"><h3><center><b>অনুমোদিত</b></center></h3></div><br>',
            notSubmitted: '<div class="callout callout-danger" style="margin-bottom: 0!important;"><h3><center><b>অনুমোদিত না</b></center></h3></div><br>',
            pending: '<div class="callout callout-warning" style="margin-bottom: 0!important;"><h3><center><b>অপেক্ষাধীন রয়েছে</b></center></h3></div><br>'
        },
        submissionStatus: function (type) {
            var html = this.status[type];
            $('#submitStatus').html(html);
        },
        submissionModal: function (fn) {
            var $o = $("#modal-report-submit");
            return $o.modal(fn);
        },
        conversationModal: function (fn) {
            var $o = $("#modal-report-response");
            return $o.modal(fn);
        },
        submissionButton: function (fn, key, val) { // show or hide;
            var $o = $("#submitDataButton");
            return fn ? $o[fn](key, val) : $o;
        },
    };
});
