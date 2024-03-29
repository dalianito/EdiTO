var deployJava = function() {
	var l = {
		core : [ "id", "class", "title", "style" ],
		i18n : [ "lang", "dir" ],
		events : [ "onclick", "ondblclick", "onmousedown", "onmouseup",
				"onmouseover", "onmousemove", "onmouseout", "onkeypress",
				"onkeydown", "onkeyup" ],
		applet : [ "codebase", "code", "name", "archive", "object", "width",
				"height", "alt", "align", "hspace", "vspace" ],
		object : [ "classid", "codebase", "codetype", "data", "type",
				"archive", "declare", "standby", "height", "width", "usemap",
				"name", "tabindex", "align", "border", "hspace", "vspace" ]
	};
	var b = l.object.concat(l.core, l.i18n, l.events);
	var m = l.applet.concat(l.core);
	function g(n) {
		if (!d.debug) {
			return
		}
		if (console.log) {
			console.log(n)
		}
		else {
			alert(n)
		}
	}
	function k(o, n) {
		if (o == null || o.length == 0) {
			return true
		}
		var q = o.charAt(o.length - 1);
		if (q != "+" && q != "*" && (o.indexOf("_") != -1 && q != "_")) {
			o = o + "*";
			q = "*"
		}
		o = o.substring(0, o.length - 1);
		if (o.length > 0) {
			var p = o.charAt(o.length - 1);
			if (p == "." || p == "_") {
				o = o.substring(0, o.length - 1)
			}
		}
		if (q == "*") {
			return (n.indexOf(o) == 0)
		}
		else {
			if (q == "+") {
				return o <= n
			}
		}
		return false
	}
	function e() {
		var n = "//java.com/js/webstart.png";
		try {
			return document.location.protocol.indexOf("http") != -1 ? n
					: "http:" + n
		}
		catch (o) {
			return "http:" + n
		}
	}
	function j(p, o) {
		var n = p.length;
		for ( var q = 0; q < n; q++) {
			if (p[q] === o) {
				return true
			}
		}
		return false
	}
	function c(n) {
		return j(m, n.toLowerCase())
	}
	function i(n) {
		return j(b, n.toLowerCase())
	}
	function a(n) {
		if ("MSIE" != deployJava.browserName) {
			return true
		}
		if (deployJava.compareVersionToPattern(deployJava.getPlugin().version,
				[ "10", "0", "0" ], false, true)) {
			return true
		}
		if (n == null) {
			return false
		}
		return !k("1.6.0_33+", n)
	}
	var d = {
		debug : null,
		version : "20120801",
		firefoxJavaVersion : null,
		myInterval : null,
		preInstallJREList : null,
		returnPage : null,
		brand : null,
		locale : null,
		installType : null,
		EAInstallEnabled : false,
		EarlyAccessURL : null,
		getJavaURL : "http://jdl.sun.com/webapps/getjava/BrowserRedirect?host=java.com",
		oldMimeType : "application/npruntime-scriptable-plugin;DeploymentToolkit",
		mimeType : "application/java-deployment-toolkit",
		launchButtonPNG : e(),
		browserName : null,
		browserName2 : null,
		getJREs : function() {
			var r = new Array();
			if (this.isPluginInstalled()) {
				var q = this.getPlugin();
				var n = q.jvms;
				for ( var p = 0; p < n.getLength(); p++) {
					r[p] = n.get(p).version
				}
			}
			else {
				var o = this.getBrowser();
				if (o == "MSIE") {
					if (this.testUsingActiveX("1.7.0")) {
						r[0] = "1.7.0"
					}
					else {
						if (this.testUsingActiveX("1.6.0")) {
							r[0] = "1.6.0"
						}
						else {
							if (this.testUsingActiveX("1.5.0")) {
								r[0] = "1.5.0"
							}
							else {
								if (this.testUsingActiveX("1.4.2")) {
									r[0] = "1.4.2"
								}
								else {
									if (this.testForMSVM()) {
										r[0] = "1.1"
									}
								}
							}
						}
					}
				}
				else {
					if (o == "Netscape Family") {
						this.getJPIVersionUsingMimeType();
						if (this.firefoxJavaVersion != null) {
							r[0] = this.firefoxJavaVersion
						}
						else {
							if (this.testUsingMimeTypes("1.7")) {
								r[0] = "1.7.0"
							}
							else {
								if (this.testUsingMimeTypes("1.6")) {
									r[0] = "1.6.0"
								}
								else {
									if (this.testUsingMimeTypes("1.5")) {
										r[0] = "1.5.0"
									}
									else {
										if (this.testUsingMimeTypes("1.4.2")) {
											r[0] = "1.4.2"
										}
										else {
											if (this.browserName2 == "Safari") {
												if (this
														.testUsingPluginsArray("1.7.0")) {
													r[0] = "1.7.0"
												}
												else {
													if (this
															.testUsingPluginsArray("1.6")) {
														r[0] = "1.6.0"
													}
													else {
														if (this
																.testUsingPluginsArray("1.5")) {
															r[0] = "1.5.0"
														}
														else {
															if (this
																	.testUsingPluginsArray("1.4.2")) {
																r[0] = "1.4.2"
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
			if (this.debug) {
				for ( var p = 0; p < r.length; ++p) {
					g("[getJREs()] We claim to have detected Java SE " + r[p])
				}
			}
			return r
		},
		installJRE : function(q, o) {
			var n = false;
			if (this.isPluginInstalled() && this.isAutoInstallEnabled(q)) {
				var p = false;
				if (this.isCallbackSupported()) {
					p = this.getPlugin().installJRE(q, o)
				}
				else {
					p = this.getPlugin().installJRE(q)
				}
				if (p) {
					this.refresh();
					if (this.returnPage != null) {
						document.location = this.returnPage
					}
				}
				return p
			}
			else {
				return this.installLatestJRE()
			}
		},
		isAutoInstallEnabled : function(n) {
			if (!this.isPluginInstalled()) {
				return false
			}
			if (typeof n == "undefined") {
				n = null
			}
			return a(n)
		},
		isCallbackSupported : function() {
			return this.isPluginInstalled()
					&& this.compareVersionToPattern(this.getPlugin().version, [
							"10", "2", "0" ], false, true)
		},
		installLatestJRE : function(p) {
			if (this.isPluginInstalled() && this.isAutoInstallEnabled()) {
				var q = false;
				if (this.isCallbackSupported()) {
					q = this.getPlugin().installLatestJRE(p)
				}
				else {
					q = this.getPlugin().installLatestJRE()
				}
				if (q) {
					this.refresh();
					if (this.returnPage != null) {
						document.location = this.returnPage
					}
				}
				return q
			}
			else {
				var o = this.getBrowser();
				var n = navigator.platform.toLowerCase();
				if ((this.EAInstallEnabled == "true")
						&& (n.indexOf("win") != -1)
						&& (this.EarlyAccessURL != null)) {
					this.preInstallJREList = this.getJREs();
					if (this.returnPage != null) {
						this.myInterval = setInterval("deployJava.poll()", 3000)
					}
					location.href = this.EarlyAccessURL;
					return false
				}
				else {
					if (o == "MSIE") {
						return this.IEInstall()
					}
					else {
						if ((o == "Netscape Family")
								&& (n.indexOf("win32") != -1)) {
							return this.FFInstall()
						}
						else {
							location.href = this.getJavaURL
									+ ((this.returnPage != null) ? ("&returnPage=" + this.returnPage)
											: "")
									+ ((this.locale != null) ? ("&locale=" + this.locale)
											: "")
									+ ((this.brand != null) ? ("&brand=" + this.brand)
											: "")
						}
					}
					return false
				}
			}
		},
		runApplet : function(o, t, q) {
			if (q == "undefined" || q == null) {
				q = "1.1"
			}
			var r = "^(\\d+)(?:\\.(\\d+)(?:\\.(\\d+)(?:_(\\d+))?)?)?$";
			var n = q.match(r);
			if (this.returnPage == null) {
				this.returnPage = document.location
			}
			if (n != null) {
				var p = this.getBrowser();
				if (p != "?") {
					if (this.versionCheck(q + "+")) {
						this.writeAppletTag(o, t)
					}
					else {
						if (this.installJRE(q + "+")) {
							this.refresh();
							location.href = document.location;
							this.writeAppletTag(o, t)
						}
					}
				}
				else {
					this.writeAppletTag(o, t)
				}
			}
			else {
				g("[runApplet()] Invalid minimumVersion argument to runApplet():"
						+ q)
			}
		},
		writeAppletTag : function(q, v) {
			var n = "<applet ";
			var p = "";
			var r = "</applet>";
			var w = true;
			if (null == v || typeof v != "object") {
				v = new Object()
			}
			for ( var o in q) {
				if (!c(o)) {
					v[o] = q[o]
				}
				else {
					n += (" " + o + '="' + q[o] + '"');
					if (o == "code") {
						w = false
					}
				}
			}
			var u = false;
			for ( var t in v) {
				if (t == "codebase_lookup") {
					u = true
				}
				if (t == "object" || t == "java_object" || t == "java_code") {
					w = false
				}
				p += '<param name="' + t + '" value="' + v[t] + '"/>'
			}
			if (!u) {
				p += '<param name="codebase_lookup" value="false"/>'
			}
			if (w) {
				n += (' code="dummy"')
			}
			n += ">";
			document.write(n + "\n" + p + "\n" + r)
		},
		versionCheck : function(o) {
			var u = 0;
			var w = "^(\\d+)(?:\\.(\\d+)(?:\\.(\\d+)(?:_(\\d+))?)?)?(\\*|\\+)?$";
			var x = o.match(w);
			if (x != null) {
				var q = false;
				var t = false;
				var p = new Array();
				for ( var r = 1; r < x.length; ++r) {
					if ((typeof x[r] == "string") && (x[r] != "")) {
						p[u] = x[r];
						u++
					}
				}
				if (p[p.length - 1] == "+") {
					t = true;
					q = false;
					p.length--
				}
				else {
					if (p[p.length - 1] == "*") {
						t = false;
						q = true;
						p.length--
					}
					else {
						if (p.length < 4) {
							t = false;
							q = true
						}
					}
				}
				var v = this.getJREs();
				for ( var r = 0; r < v.length; ++r) {
					if (this.compareVersionToPattern(v[r], p, q, t)) {
						return true
					}
				}
				return false
			}
			else {
				var n = "Invalid versionPattern passed to versionCheck: " + o;
				g("[versionCheck()] " + n);
				alert(n);
				return false
			}
		},
		isWebStartInstalled : function(q) {
			var p = this.getBrowser();
			if (p == "?") {
				return true
			}
			if (q == "undefined" || q == null) {
				q = "1.4.2"
			}
			var o = false;
			var r = "^(\\d+)(?:\\.(\\d+)(?:\\.(\\d+)(?:_(\\d+))?)?)?$";
			var n = q.match(r);
			if (n != null) {
				o = this.versionCheck(q + "+")
			}
			else {
				g("[isWebStartInstaller()] Invalid minimumVersion argument to isWebStartInstalled(): "
						+ q);
				o = this.versionCheck("1.4.2+")
			}
			return o
		},
		getJPIVersionUsingMimeType : function() {
			for ( var o = 0; o < navigator.mimeTypes.length; ++o) {
				var p = navigator.mimeTypes[o].type;
				var n = p
						.match(/^application\/x-java-applet;jpi-version=(.*)$/);
				if (n != null) {
					this.firefoxJavaVersion = n[1];
					if ("Opera" != this.browserName2) {
						break
					}
				}
			}
		},
		launchWebStartApplication : function(q) {
			var n = navigator.userAgent.toLowerCase();
			this.getJPIVersionUsingMimeType();
			if (this.isWebStartInstalled("1.7.0") == false) {
				if ((this.installJRE("1.7.0+") == false)
						|| ((this.isWebStartInstalled("1.7.0") == false))) {
					return false
				}
			}
			var t = null;
			if (document.documentURI) {
				t = document.documentURI
			}
			if (t == null) {
				t = document.URL
			}
			var o = this.getBrowser();
			var p;
			if (o == "MSIE") {
				p = '<object classid="clsid:8AD9C840-044E-11D1-B3E9-00805F499D93" width="0" height="0"><PARAM name="launchjnlp" value="'
						+ q
						+ '"><PARAM name="docbase" value="'
						+ t
						+ '"></object>'
			}
			else {
				if (o == "Netscape Family") {
					p = '<embed type="application/x-java-applet;jpi-version='
							+ this.firefoxJavaVersion
							+ '" width="0" height="0" launchjnlp="' + q
							+ '"docbase="' + t + '" />'
				}
			}
			if (document.body == "undefined" || document.body == null) {
				document.write(p);
				document.location = t
			}
			else {
				var r = document.createElement("div");
				r.id = "div1";
				r.style.position = "relative";
				r.style.left = "-10000px";
				r.style.margin = "0px auto";
				r.className = "dynamicDiv";
				r.innerHTML = p;
				document.body.appendChild(r)
			}
		},
		createWebStartLaunchButtonEx : function(p, o) {
			if (this.returnPage == null) {
				this.returnPage = p
			}
			var n = "javascript:deployJava.launchWebStartApplication('" + p
					+ "');";
			document
					.write('<a href="'
							+ n
							+ '" onMouseOver="window.status=\'\'; return true;"><img src="'
							+ this.launchButtonPNG + '" border="0" /></a>')
		},
		createWebStartLaunchButton : function(p, o) {
			if (this.returnPage == null) {
				this.returnPage = p
			}
			var n = "javascript:if (!deployJava.isWebStartInstalled(&quot;"
					+ o
					+ "&quot;)) {if (deployJava.installLatestJRE()) {if (deployJava.launch(&quot;"
					+ p + "&quot;)) {}}} else {if (deployJava.launch(&quot;"
					+ p + "&quot;)) {}}";
			document
					.write('<a href="'
							+ n
							+ '" onMouseOver="window.status=\'\'; return true;"><img src="'
							+ this.launchButtonPNG + '" border="0" /></a>')
		},
		launch : function(n) {
			document.location = n;
			return true
		},
		isPluginInstalled : function() {
			var n = this.getPlugin();
			if (n && n.jvms) {
				return true
			}
			else {
				return false
			}
		},
		isAutoUpdateEnabled : function() {
			if (this.isPluginInstalled()) {
				return this.getPlugin().isAutoUpdateEnabled()
			}
			return false
		},
		setAutoUpdateEnabled : function() {
			if (this.isPluginInstalled()) {
				return this.getPlugin().setAutoUpdateEnabled()
			}
			return false
		},
		setInstallerType : function(n) {
			this.installType = n;
			if (this.isPluginInstalled()) {
				return this.getPlugin().setInstallerType(n)
			}
			return false
		},
		setAdditionalPackages : function(n) {
			if (this.isPluginInstalled()) {
				return this.getPlugin().setAdditionalPackages(n)
			}
			return false
		},
		setEarlyAccess : function(n) {
			this.EAInstallEnabled = n
		},
		isPlugin2 : function() {
			if (this.isPluginInstalled()) {
				if (this.versionCheck("1.6.0_10+")) {
					try {
						return this.getPlugin().isPlugin2()
					}
					catch (n) {
					}
				}
			}
			return false
		},
		allowPlugin : function() {
			this.getBrowser();
			var n = ("Safari" != this.browserName2 && "Opera" != this.browserName2);
			return n
		},
		getPlugin : function() {
			this.refresh();
			var n = null;
			if (this.allowPlugin()) {
				n = document.getElementById("deployJavaPlugin")
			}
			return n
		},
		compareVersionToPattern : function(u, o, q, r) {
			if (u == undefined || o == undefined) {
				return false
			}
			var v = "^(\\d+)(?:\\.(\\d+)(?:\\.(\\d+)(?:_(\\d+))?)?)?$";
			var w = u.match(v);
			if (w != null) {
				var t = 0;
				var x = new Array();
				for ( var p = 1; p < w.length; ++p) {
					if ((typeof w[p] == "string") && (w[p] != "")) {
						x[t] = w[p];
						t++
					}
				}
				var n = Math.min(x.length, o.length);
				if (r) {
					for ( var p = 0; p < n; ++p) {
						if (x[p] < o[p]) {
							return false
						}
						else {
							if (x[p] > o[p]) {
								return true
							}
						}
					}
					return true
				}
				else {
					for ( var p = 0; p < n; ++p) {
						if (x[p] != o[p]) {
							return false
						}
					}
					if (q) {
						return true
					}
					else {
						return (x.length == o.length)
					}
				}
			}
			else {
				return false
			}
		},
		getBrowser : function() {
			if (this.browserName == null) {
				var n = navigator.userAgent.toLowerCase();
				g("[getBrowser()] navigator.userAgent.toLowerCase() -> " + n);
				if ((n.indexOf("msie") != -1) && (n.indexOf("opera") == -1)) {
					this.browserName = "MSIE";
					this.browserName2 = "MSIE"
				}
				else {
					if (n.indexOf("iphone") != -1) {
						this.browserName = "Netscape Family";
						this.browserName2 = "iPhone"
					}
					else {
						if ((n.indexOf("firefox") != -1)
								&& (n.indexOf("opera") == -1)) {
							this.browserName = "Netscape Family";
							this.browserName2 = "Firefox"
						}
						else {
							if (n.indexOf("chrome") != -1) {
								this.browserName = "Netscape Family";
								this.browserName2 = "Chrome"
							}
							else {
								if (n.indexOf("safari") != -1) {
									this.browserName = "Netscape Family";
									this.browserName2 = "Safari"
								}
								else {
									if ((n.indexOf("mozilla") != -1)
											&& (n.indexOf("opera") == -1)) {
										this.browserName = "Netscape Family";
										this.browserName2 = "Other"
									}
									else {
										if (n.indexOf("opera") != -1) {
											this.browserName = "Netscape Family";
											this.browserName2 = "Opera"
										}
										else {
											this.browserName = "?";
											this.browserName2 = "unknown"
										}
									}
								}
							}
						}
					}
				}
				g("[getBrowser()] Detected browser name:" + this.browserName
						+ ", " + this.browserName2)
			}
			return this.browserName
		},
		testUsingActiveX : function(n) {
			var p = "JavaWebStart.isInstalled." + n + ".0";
			if (typeof ActiveXObject == "undefined" || !ActiveXObject) {
				g("[testUsingActiveX()] Browser claims to be IE, but no ActiveXObject object?");
				return false
			}
			try {
				return (new ActiveXObject(p) != null)
			}
			catch (o) {
				return false
			}
		},
		testForMSVM : function() {
			var o = "{08B0E5C0-4FCB-11CF-AAA5-00401C608500}";
			if (typeof oClientCaps != "undefined") {
				var n = oClientCaps.getComponentVersion(o, "ComponentID");
				if ((n == "") || (n == "5,0,5000,0")) {
					return false
				}
				else {
					return true
				}
			}
			else {
				return false
			}
		},
		testUsingMimeTypes : function(o) {
			if (!navigator.mimeTypes) {
				g("[testUsingMimeTypes()] Browser claims to be Netscape family, but no mimeTypes[] array?");
				return false
			}
			for ( var p = 0; p < navigator.mimeTypes.length; ++p) {
				s = navigator.mimeTypes[p].type;
				var n = s
						.match(/^application\/x-java-applet\x3Bversion=(1\.8|1\.7|1\.6|1\.5|1\.4\.2)$/);
				if (n != null) {
					if (this.compareVersions(n[1], o)) {
						return true
					}
				}
			}
			return false
		},
		testUsingPluginsArray : function(o) {
			if ((!navigator.plugins) || (!navigator.plugins.length)) {
				return false
			}
			var n = navigator.platform.toLowerCase();
			for ( var p = 0; p < navigator.plugins.length; ++p) {
				s = navigator.plugins[p].description;
				if (s.search(/^Java Switchable Plug-in (Cocoa)/) != -1) {
					if (this.compareVersions("1.5.0", o)) {
						return true
					}
				}
				else {
					if (s.search(/^Java/) != -1) {
						if (n.indexOf("win") != -1) {
							if (this.compareVersions("1.5.0", o)
									|| this.compareVersions("1.6.0", o)) {
								return true
							}
						}
					}
				}
			}
			if (this.compareVersions("1.5.0", o)) {
				return true
			}
			return false
		},
		IEInstall : function() {
			location.href = this.getJavaURL
					+ ((this.returnPage != null) ? ("&returnPage=" + this.returnPage)
							: "")
					+ ((this.locale != null) ? ("&locale=" + this.locale) : "")
					+ ((this.brand != null) ? ("&brand=" + this.brand) : "");
			return false
		},
		done : function(o, n) {
		},
		FFInstall : function() {
			location.href = this.getJavaURL
					+ ((this.returnPage != null) ? ("&returnPage=" + this.returnPage)
							: "")
					+ ((this.locale != null) ? ("&locale=" + this.locale) : "")
					+ ((this.brand != null) ? ("&brand=" + this.brand) : "")
					+ ((this.installType != null) ? ("&type=" + this.installType)
							: "");
			return false
		},
		compareVersions : function(q, r) {
			var o = q.split(".");
			var n = r.split(".");
			for ( var p = 0; p < o.length; ++p) {
				o[p] = Number(o[p])
			}
			for ( var p = 0; p < n.length; ++p) {
				n[p] = Number(n[p])
			}
			if (o.length == 2) {
				o[2] = 0
			}
			if (o[0] > n[0]) {
				return true
			}
			if (o[0] < n[0]) {
				return false
			}
			if (o[1] > n[1]) {
				return true
			}
			if (o[1] < n[1]) {
				return false
			}
			if (o[2] > n[2]) {
				return true
			}
			if (o[2] < n[2]) {
				return false
			}
			return true
		},
		enableAlerts : function() {
			this.browserName = null;
			this.debug = true
		},
		poll : function() {
			this.refresh();
			var n = this.getJREs();
			if ((this.preInstallJREList.length == 0) && (n.length != 0)) {
				clearInterval(this.myInterval);
				if (this.returnPage != null) {
					location.href = this.returnPage
				}
			}
			if ((this.preInstallJREList.length != 0) && (n.length != 0)
					&& (this.preInstallJREList[0] != n[0])) {
				clearInterval(this.myInterval);
				if (this.returnPage != null) {
					location.href = this.returnPage
				}
			}
		},
		writePluginTag : function() {
			var n = this.getBrowser();
			if (n == "MSIE") {
				document
						.write('<object classid="clsid:CAFEEFAC-DEC7-0000-0001-ABCDEFFEDCBA" id="deployJavaPlugin" width="0" height="0"></object>')
			}
			else {
				if (n == "Netscape Family" && this.allowPlugin()) {
					this.writeEmbedTag()
				}
			}
		},
		refresh : function() {
			navigator.plugins.refresh(false);
			var n = this.getBrowser();
			if (n == "Netscape Family" && this.allowPlugin()) {
				var o = document.getElementById("deployJavaPlugin");
				if (o == null) {
					this.writeEmbedTag()
				}
			}
		},
		writeEmbedTag : function() {
			var n = false;
			if (navigator.mimeTypes != null) {
				for ( var o = 0; o < navigator.mimeTypes.length; o++) {
					if (navigator.mimeTypes[o].type == this.mimeType) {
						if (navigator.mimeTypes[o].enabledPlugin) {
							document
									.write('<embed id="deployJavaPlugin" type="' + this.mimeType + '" hidden="true" />');
							n = true
						}
					}
				}
				if (!n) {
					for ( var o = 0; o < navigator.mimeTypes.length; o++) {
						if (navigator.mimeTypes[o].type == this.oldMimeType) {
							if (navigator.mimeTypes[o].enabledPlugin) {
								document
										.write('<embed id="deployJavaPlugin" type="' + this.oldMimeType + '" hidden="true" />')
							}
						}
					}
				}
			}
		}
	};
	d.writePluginTag();
	if (d.locale == null) {
		var h = null;
		if (h == null) {
			try {
				h = navigator.userLanguage
			}
			catch (f) {
			}
		}
		if (h == null) {
			try {
				h = navigator.systemLanguage
			}
			catch (f) {
			}
		}
		if (h == null) {
			try {
				h = navigator.language
			}
			catch (f) {
			}
		}
		if (h != null) {
			h.replace("-", "_");
			d.locale = h
		}
	}
	return d
}();
