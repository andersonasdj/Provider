// (C) 2009 henrik.lindqvist@llamalab.com

(function(d, dp) {
	d.i18n = function(l) {
		return (typeof l == 'string') ? (l in Date.i18n ? Date.i18n[l] : Date
				.i18n(l.substr(0, l.lastIndexOf('-')))) : (l || Date
				.i18n(navigator.language || navigator.browserLanguage || ''));
	};
	d.i18n.inherit = function(l, o) {
		l = Date.i18n(l);
		for ( var k in l)
			if (typeof o[k] == 'undefined')
				o[k] = l[k];
		return o;
	};
	d.i18n[''] = d.i18n['en'] = d.i18n['en-US'] = {
		months : {
			abbr : [ 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug',
					'Sep', 'Oct', 'Nov', 'Dec' ],
			full : [ 'January', 'February', 'March', 'April', 'May', 'June',
					'July', 'August', 'September', 'October', 'November',
					'December' ]
		},
		days : {
			abbr : [ 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat' ],
			full : [ 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday',
					'Friday', 'Saturday' ]
		},
		week : {
			abbr : 'Wk',
			full : 'Week'
		},
		ad : 'AD',
		am : 'AM',
		pm : 'PM',
		gmt : 'GMT',
		z : ':',
		Z : '',
		fdow : 0,
		mdifw : 1
	};
	d.i18n['iso'] = d.i18n.inherit('en', {
		Z : ':',
		fdow : 1,
		mdifw : 4
	});
	d.WEEK = 6048e5;
	d.DAY = 864e5;
	d.HOUR = 36e5;
	d.MINUTE = 6e4
	d.SECOND = 1000;
	d.today = function() {
		return new Date().datePart();
	};
	dp.clone = function() {
		return new Date(+this);
	};
	dp.datePart = function() {
		with (this)
			return new Date(getFullYear(), getMonth(), getDate());
	};
	dp.timePart = function() {
		with (this)
			return new Date(1970, 0, 1, getHours(), getMinutes(), getSeconds(),
					getMilliseconds());
	};
	dp.setDay = function(d) {
		with (this)
			setDate((getDate() - getDay()) + d);
	};
	dp.getDayOfWeek = function(o) {
		if (typeof o != 'number')
			o = Date.i18n(o).fdow;
		var d = this.getDay() - o;
		if (d < 0)
			d += 7;
		return d + 1;
	};
	dp.setDayOfWeek = function(d, o) {
		with (this)
			setDate((getDate() - getDayOfWeek(o)) + d);
	};
	dp.getDaysInMonth = function() {
		with (this.clone()) {
			setDate(32);
			return 32 - getDate();
		}
	};
	dp.getDaysInYear = function() {
		var y = this.getFullYear();
		return Math.floor((Date.UTC(y + 1, 0, 1) - Date.UTC(y, 0, 1))
				/ Date.DAY);
	};
	dp.getDayOfYear = function() {
		return Math.floor((this - new Date(this.getFullYear(), 0, 1))
				/ Date.DAY) + 1;
	};
	dp.setDayOfYear = function(d) {
		this.setMonth(0, d);
	};
	dp.getWeekOfMonth = function(l) {
		l = Date.i18n(l);
		with (this.clone()) {
			setDate(1);
			var d = (7 - (getDay() - l.fdow)) % 7;
			d = (d < l.mdifw) ? -d : (7 - d);
			return Math.ceil((this.getDate() + d) / 7);
		}
	};
	dp.setWeekOfMonth = function(w, l) {
		l = Date.i18n(l);
		with (this.clone()) {
			setDate(1);
			var d = (7 - (getDay() - l.fdow)) % 7;
			d = (d < l.mdifw) ? -d : (7 - d);
			setDate(d);
		}
	};
	dp.getWeekOfYear = function(l) {
		l = Date.i18n(l);
		with (this.clone()) {
			setMonth(0, 1);
			var d = (7 - (getDay() - l.fdow)) % 7;
			if (l.mdifw < d)
				d -= 7;
			setDate(d);
			var w = Math.ceil((+this - valueOf()) / Date.WEEK);
			return (w <= getWeeksInYear()) ? w : 1;
		}
	};
	dp.setWeekOfYear = function(w, l) {
		l = Date.i18n(l);
		with (this) {
			setMonth(0, 1);
			var d = (7 - (getDay() - l.fdow)) % 7;
			if (l.mdifw < d)
				d -= 7;
			d += w * 7;
			setDate(d);
		}
	};
	dp.getWeeksInYear = function() {
		var y = this.getFullYear();
		return 52 + (new Date(y, 0, 1).getDay() == 4 || new Date(y, 11, 31)
				.getDay() == 4);
	};
	dp.setTimezoneOffset = function(o) {
		with (this)
			setTime(valueOf() + ((getTimezoneOffset() + -o) * Date.MINUTE));
	};
	dp.format = function(p, l) {
		var i18n = Date.i18n(l);
		var d = this;
		var pad = function(n, l) {
			for (n = String(n), l -= n.length; --l >= 0; n = '0' + n)
				;
			return n;
		};
		var tz = function(n, s) {
			return ((n < 0) ? '+' : '-') + pad(Math.abs(n / 60), 2) + s
					+ pad(Math.abs(n % 60), 2);
		};
		return p
				.replace(
						/([aDdEFGHhKkMmSsWwyZz])\1*|'[^']*'|"[^"]*"/g,
						function(m) {
							l = m.length;
							switch (m.charAt(0)) {
							case 'a':
								return (d.getHours() < 12) ? i18n.am : i18n.pm;
							case 'D':
								return pad(d.getDayOfYear(), l);
							case 'd':
								return pad(d.getDate(), l);
							case 'E':
								return i18n.days[(l > 3) ? 'full' : 'abbr'][d
										.getDay()];
							case 'F':
								return pad(d.getDayOfWeek(i18n), l);
							case 'G':
								return i18n.ad;
							case 'H':
								return pad(d.getHours(), l);
							case 'h':
								return pad(d.getHours() % 12 || 12, l);
							case 'K':
								return pad(d.getHours() % 12, l);
							case 'k':
								return pad(d.getHours() || 24, l);
							case 'M':
								return (l < 3) ? pad(d.getMonth() + 1, l)
										: i18n.months[(l > 3) ? 'full' : 'abbr'][d
												.getMonth()];
							case 'm':
								return pad(d.getMinutes(), l);
							case 'S':
								return pad(d.getMilliseconds(), l);
							case 's':
								return pad(d.getSeconds(), l);
							case 'W':
								return pad(d.getWeekOfMonth(i18n), l);
							case 'w':
								return pad(d.getWeekOfYear(i18n), l);
							case 'y':
								return (l == 2) ? String(d.getFullYear())
										.substr(2) : pad(d.getFullYear(), l);
							case 'Z':
								return tz(d.getTimezoneOffset(), i18n.Z);
							case 'z':
								return i18n.gmt
										+ tz(d.getTimezoneOffset(), i18n.z);
							case "'":
							case '"':
								return m.substr(1, l - 2);
							default:
								throw new Error('Illegal pattern');
							}
						});
	}
	d.parse = function(s, p, l) {
		if (!p)
			return arguments.callee.original.call(this);
		var i18n = Date.i18n(l), d = new Date(1970, 0, 1, 0, 0, 0, 0);
		var pi = 0, si = 0, i, j, k, c;
		var num = function(x) {
			if (x)
				l = x;
			else if (!/[DdFHhKkMmSsWwy]/.test(p.charAt(pi)))
				l = Number.MAX_VALUE;
			for (i = si; --l >= 0 && /[0-9]/.test(s.charAt(si)); si++)
				;
			if (i == si)
				throw 1;
			return parseInt(s.substring(i, si), 10);
		};
		var cmp = function(x) {
			if (s.substr(si, x.length).toLowerCase() != x.toLowerCase())
				return false;
			si += x.length;
			return true;
		};
		var idx = function(x) {
			for (i = x.length; --i >= 0;)
				if (cmp(x[i]))
					return i + 1;
			return 0;
		};
		try {
			while (pi < p.length) {
				c = p.charAt(l = pi);
				if (/[aDdEFGHhKkMmSsWwyZz]/.test(c)) {
					while (p.charAt(++pi) == c)
						;
					l = pi - l;
					switch (c) {
					case 'a':
						if (cmp(i18n.pm))
							d.setHours(12 + d.getHours());
						else if (!cmp(i18n.am))
							throw 2;
						break;
					case 'D':
						d.setDayOfYear(num());
						break;
					case 'd':
						d.setDate(num());
						break;
					case 'E':
						if (i = idx(i18n.days.full))
							d.setDay(i - 1);
						else if (i = idx(i18n.days.abbr))
							d.setDay(i - 1);
						else
							throw 3;
						break;
					case 'F':
						d.setDayOfWeek(num(), i18n);
						break;
					case 'G':
						if (!cmp(i18n.ad))
							throw 4;
						break;
					case 'H':
					case 'k':
						d.setHours((i = num()) < 24 ? i : 0);
						break;
					case 'K':
					case 'h':
						d.setHours((i = num()) < 12 ? i : 0);
						break;
					case 'M':
						if (l < 3)
							d.setMonth(num() - 1);
						else if (i = idx(i18n.months.full))
							d.setMonth(i - 1);
						else if (i = idx(i18n.months.abbr))
							d.setMonth(i - 1);
						else
							throw 5;
						break;
					case 'm':
						d.setMinutes(num());
						break;
					case 'S':
						d.setMilliseconds(num());
						break;
					case 's':
						d.setSeconds(num());
						break;
					case 'W':
						d.setWeekOfMonth(num(), i18n);
						break;
					case 'w':
						d.setWeekOfYear(num(), i18n);
						break;
					case 'y':
						d.setFullYear((l == 2) ? 2000 + num() : num());
						break;
					case 'z':
						if (!cmp(i18n.gmt))
							throw 6;
					case 'Z':
						if (!/[+-]/.test(j = s.charAt(si++)))
							throw 6;
						k = num(2) * 60;
						if (!cmp(i18n[c]))
							throw 7;
						k += num(2);
						d.setTimezoneOffset((j == '+') ? -k : k);
					}
				} else if (/["']/.test(c)) {
					while (++pi < p.length && p.charAt(pi) != c)
						;
					if (!cmp(p.substring(l + 1, pi++)))
						throw 8;
				} else {
					while (pi < p.length
							&& !/[aDdEFGHhKkMmSsWwyZz"']/.test(p.charAt(pi)))
						pi++;
					if (!cmp(p.substring(l, pi)))
						throw 9;
				}
			}
			return d;
		} catch (e) {
			if (e > 0)
				return Number.NaN;
			throw e;
		}
	};
	d.parse.original = d.parse;
})(Date, Date.prototype);