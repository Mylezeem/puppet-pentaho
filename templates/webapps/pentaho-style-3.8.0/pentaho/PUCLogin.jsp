<%@ taglib prefix='c' uri='http://java.sun.com/jstl/core'%>
<%@
    page language="java"
	import="org.springframework.security.ui.AbstractProcessingFilter,org.springframework.security.ui.webapp.AuthenticationProcessingFilter,org.springframework.security.ui.savedrequest.SavedRequest,org.springframework.security.AuthenticationException,org.pentaho.platform.uifoundation.component.HtmlComponent,org.pentaho.platform.engine.core.system.PentahoSystem,org.pentaho.platform.util.messages.LocaleHelper,org.pentaho.platform.api.engine.IPentahoSession,org.pentaho.platform.web.http.WebTemplateHelper,org.pentaho.platform.api.engine.IUITemplater,org.pentaho.platform.web.jsp.messages.Messages,java.util.List,java.util.ArrayList,java.util.StringTokenizer,org.apache.commons.lang.StringEscapeUtils,org.pentaho.platform.web.http.PentahoHttpSessionHelper"%>



<%!// List of request URL strings to look for to send 401

	private List<String> send401RequestList;

	public void jspInit() {
		// super.jspInit(); 
		send401RequestList = new ArrayList<String>();
		String unauthList = getServletConfig().getInitParameter("send401List"); //$NON-NLS-1$
		if (unauthList == null) {
			send401RequestList.add("AdhocWebService"); //$NON-NLS-1$
		} else {
			StringTokenizer st = new StringTokenizer(unauthList, ","); //$NON-NLS-1$
			String requestStr;
			while (st.hasMoreElements()) {
				requestStr = st.nextToken();
				send401RequestList.add(requestStr.trim());
			}
		}
	}%>

<%
	response.setCharacterEncoding(LocaleHelper.getSystemEncoding());
	String path = request.getContextPath();

	IPentahoSession userSession = PentahoHttpSessionHelper
			.getPentahoSession(request);
	// SPRING_SECURITY_SAVED_REQUEST_KEY contains the URL the user originally wanted before being redirected to the login page
	// if the requested url is in the list of URLs specified in the web.xml's init-param send401List,
	// then return a 401 status now and don't show a login page (401 means not authenticated)
	Object reqObj = request.getSession().getAttribute(AbstractProcessingFilter.SPRING_SECURITY_SAVED_REQUEST_KEY);
	String requestedURL = "";
	if (reqObj != null) {
		requestedURL = ((SavedRequest) reqObj).getFullRequestUrl();

		String lookFor;
		for (int i = 0; i < send401RequestList.size(); i++) {
			lookFor = send401RequestList.get(i);
			if (requestedURL.indexOf(lookFor) >= 0) {
				response.sendError(401);
				return;
			}
		}
	}

	boolean loggedIn;
	String remoteUser = request.getRemoteUser();
	if (remoteUser != null && remoteUser != "") {
		loggedIn = true;
	}
	
	int year = (new java.util.Date()).getYear() + 1900;
	
%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Pentaho User Console - Login</title>
<style type="text/css">
<!--
body,td,th {
	color: #000000;
}

body {
	background-color: #FFFFFF;
	margin: 0px;
}

p {
	margin: 0px;
	padding: 0px;
}

A:link,A:visited,A:active {
	color: #7e932f;
	text-decoration: underline;
}

A:hover {
	color: #ca6333;
	text-decoration: underline;
}

.login-banner {
	background-image: url(/pentaho-style<%= instance %>/images/login/start_banner.png);
	background-repeat: repeat-x;
	padding: 90px 0px 0px 0px;
}

.lrg_box_top {
	background-image: url(/pentaho-style<%= instance %>/images/login/start_lrg_box_top.png)
		;
	background-repeat: no-repeat;
	height: 85px;
	text-align: center;
	vertical-align: bottom;
}

.lrg_box_bottom {
	background-image:
		url(/pentaho-style<%= instance %>/images/login/start_lrg_box_bottom.png);
	background-repeat: no-repeat;
	background-position: bottom;
	padding: 0px 0px 25px 0px;
}

.sm_box_top {
	background-image: url(/pentaho-style<%= instance %>/images/login/start_sm_box_top.png);
	background-repeat: no-repeat;
	text-align: center;
	vertical-align: bottom;
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 1.2em;
	color: #7e932f;
	font-weight: 300;
	text-align: left;
	padding: 10px 0px 0px 18px;
	width: 270px;
}

.sm_box_bottom {
	background-image:
		url(/pentaho-style<%= instance %>/images/login/start_sm_box_bottom.png);
	background-repeat: no-repeat;
	background-position: bottom left;
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: .85em;
	color: #000000;
	text-align: left;
	vertical-align: top;
	padding: 10px 12px 14px 18px;
	width: 270px;
}

.start_login_title {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 1.2em;
	color: #7e932f;
	font-weight: 300;
	text-align: left;
	padding: 18px 0px 0px 18px;
}

.start_content {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: .85em;
	color: #000000;
	text-align: left;
	vertical-align: bottom;
	padding: 10px 0px 0px 18px;
}

.btn_login_box {
	background-image: url(/pentaho-style<%= instance %>/images/login/start_btn_login.png);
	width: 204px;
	height: 69px;
	text-align: center;
	margin: 18px;
	cursor: pointer;
}

.btn_login_box-hover {
	background-image:
		url(/pentaho-style<%= instance %>/images/login/start_btn_login_hover.png);
	width: 204px;
	height: 69px;
	text-align: center;
	margin: 18px;
	cursor: pointer;
}

.btn_login_title {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 1em;
	font-weight: bold;
	text-align: center;
	vertical-align: bottom;
	height: 28px;
}

.btn_login_text {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 1.5em;
	font-weight: 300;
	text-align: center;
	vertical-align: top;
	height: 41px;
}

.start_footer {
	background-image: url(/pentaho-style<%= instance %>/images/login/start_footer_bg.png);
	background-repeat: repeat-x;
	background-position: top;
	padding: 20px 0px 0px 0px;
	margin-top: 20px;
	vertical-align: bottom;
}

.footer_txt {
	width: 564px;
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: .7em;
	text-align: left;
	vertical-align: top;
}

.button {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: .85em;
	font-weight: 300;
	cursor: pointer;
}

.button .button_left {
	background-image: url('/pentaho-style<%= instance %>/images/login/button_left.png');
}

.button .button_middle {
	background-image: url('/pentaho-style<%= instance %>/images/login/button_middle.png');
	background-repeat: repeat-x;
	white-space: nowrap;
	line-height: 24px;
	vertical-align: top;
}

.button .button_right {
	background-image: url('/pentaho-style<%= instance %>/images/login/button_right.png');
}

.button_over {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: .85em;
	font-weight: 300;
	cursor: pointer;
}

.button_over .button_left {
	background-image:
		url('/pentaho-style<%= instance %>/images/login/button_left_over.png');
}

.button_over .button_middle {
	background-image:
		url('/pentaho-style<%= instance %>/images/login/button_middle_over.png');
	background-repeat: repeat-x;
	white-space: nowrap;
	line-height: 24px;
	vertical-align: top;
}

.button_over .button_right {
	background-image:
		url('/pentaho-style<%= instance %>/images/login/button_right_over.png');
}

.text {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: .85em;
	color: #000000;
	text-align: left;
}
-->
</style>
<meta name="gwt:property" content="locale=<%=request.getLocale()%>">
<link rel="shortcut icon" href="/pentaho-style<%= instance %>/favicon.ico" />
<link href="/pentaho-style<%= instance %>/styles-new.css" rel="stylesheet"
	type="text/css" />

<script type="text/javascript">
		function logout(){
			var req = null;
			if (window.XMLHttpRequest){
			  req = new XMLHttpRequest();
			} else if(windw.ActiveXObject){
			  req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			var responseHandler = function(){
			 if(req.readyState == 4){
			   if(req.status == 200){
			     openLoginDialog('<%=requestedURL%>');
			    } else {
			      window.location.href = window.location.href; 
			    }
			  }
			}
			
			if(req == null){
			  document.location="<c:url value='Logout'/>";
			} else {
		    req.onreadystatechange = responseHandler;
		    req.open("GET","<c:url value='Logout'/>",true);
		    req.send("");
			}
		}
  </script>

</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0"
	class="login-banner">
	<tr>
		<td align="center" bordercolor="0"><!--Begin First Box Row -->
		<table width="564" border="0" cellspacing="0" cellpadding="0"
			style="margin-bottom: 22px;" align="center">
			<tr>
				<td class="lrg_box_top"><a href="http://www.pentaho.com"
					target="_blank"><img
					src="/pentaho-style<%= instance %>/images/login/start_logo.png"
					alt="Pentaho Corporation" width="210" height="62" border="0" /></a></td>
			</tr>
			<tr>
				<td class="lrg_box_bottom">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="2" class="start_login_title">Welcome to the
						Pentaho User Console</td>
					</tr>
					<tr>
						<td class="start_content">
						<p>The Pentaho User Console provides access to powerful
						Business Intelligence (BI) capabilities found in the Pentaho BI
						Suite. Login or use the links below to learn more about Pentaho's
						reporting, analysis, dashboards, data mining and data integration.</p>
						</td>
						<td><!--Begin Login Button -->
						<table class="btn_login_box" border="0" cellspacing="0"
							cellpadding="0"
							onMouseOver="this.className='btn_login_box-hover'"
							onMouseOut="this.className='btn_login_box'"
							onBlur="this.className='btn_login_box'"
							onClick="this.className='btn_login_box';<%if (null != remoteUser && remoteUser.length() > 0) {%>logout()<%} else {%>openLoginDialog('<%=requestedURL%>')<%}%>">


							<%
								if (null != remoteUser && remoteUser.length() > 0) {
							%>
							<tr>
								<td class="btn_login_title">Logged In</td>
							</tr>
							<tr>
								<td class="btn_login_text">Restart Session</td>
							</tr>
							<%
								} else {
							%>
							<tr>
								<td class="btn_login_title">Pentaho User Console</td>
							</tr>
							<tr>
								<td class="btn_login_text"><%=Messages.getString("UI.USER_LOGIN")%></td>
							</tr>
							<%
								}
							%>
						</table>
						<!--End Login Button --></td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		<!--End First Box Row --> <!--Begin Second Box Row --> <!--Begin Enterprise Boxes -->
		<table width="564" border="0" cellspacing="0" cellpadding="0"
			style="margin-bottom: 22px;" align="center">
			<tr>
				<td class="sm_box_top">Achieve BI Success</td>
				<td><img src="/pentaho-style<%= instance %>/images/login/spacer.png"
					width="20" /></td>
				<td class="sm_box_top">Getting Started</td>
			</tr>
			<tr>
				<td class="sm_box_bottom" height="100%">
				<table cellspacing="0" cellpadding="0" height="100%" width="100%"
					border="0">
					<tr>
						<td height="100%" valign="top" class="text">Deploy the
						world's most popular open source BI suite with confidence,
						security, and far lower total cost of ownership than proprietary
						alternatives with the Pentaho Enterprise Edition products.<br />
						</td>
					</tr>
					<tr>
						<td><!-- GUI Button -->
						<table cellspacing="0" cellpadding="0" border="0" class="button"
							width="50" onMouseOver="this.className='button_over'"
							onMouseOut="this.className='button'" align="right"
							style="margin-top: 6px;"
							onClick="window.open('http://www.pentaho.com/products/enterprise', '_blank');">
							<tr>
								<td width="7" height="27" class="button_left"><img
									src="/pentaho-style<%= instance %>/images/login/spacer.png" width="7"
									height="27" /><br />
								</td>
								<td>
								<td class="button_middle" width="100%">Learn More</td>
								<td width="7" height="27" class="button_right"><img
									src="/pentaho-style<%= instance %>/images/login/spacer.png" width="7"
									height="27" /><br />
								</td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				<!-- End button --></td>
				<td><img src="/pentaho-style<%= instance %>/images/login/spacer.png"
					width="20" /></td>
				<td class="sm_box_bottom" height="100%">

				<table cellspacing="0" cellpadding="0" height="100%" width="100%"
					border="0">
					<tr>
						<td height="100%" valign="top" class="text">The Pentaho BI
						Suite provides a full spectrum of BI capabilities. Get a quick
						overview of how to create and share reports and analytics with the
						<span style="font-style: italic;">Evaluating Pentaho
						Reporting</span> guide. <br />
						</td>
					</tr>
					<tr>
						<td><!-- GUI Button -->
						<table cellspacing="0" cellpadding="0" border="0" class="button"
							width="50" onMouseOver="this.className='button_over'"
							onMouseOut="this.className='button'" align="right"
							style="margin-top: 6px;"
							onClick="window.open(window.location.href.replace('Login', '<%=PentahoSystem.getSystemSetting("documentation-url",
							"docs/community_user_guide.pdf")%>'), '_blank');">
							<tr>
								<td width="7" height="27" class="button_left"><img
									src="/pentaho-style<%= instance %>/images/login/spacer.png" width="7"
									height="27" /><br />
								</td>
								<td>
								<td class="button_middle" width="100%">Download PDF</td>
								<td width="7" height="27" class="button_right"><img
									src="/pentaho-style<%= instance %>/images/login/spacer.png" width="7"
									height="27" /><br />
								</td>
							</tr>
						</table>
						<!-- End button --></td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		<!--End Enterprise Boxes --> <!--End Second Box Row --></td>
	</tr>
	<!--Begin Footer -->
	<tr>
		<td align="center" class="start_footer">
		<table width="563" border="0" cellspacing="0" cellpadding="0"
			style="margin-bottom: 22px;" align="center">
			<tr>
				<td class="footer_txt">Supplied free of charge with no support,
				no certification, no maintenance, no warranty and no indemnity by
				Pentaho or its Certified Partners. <a
					href="http://www.pentaho.com/products/enterprise" target="_blank">Consider
				the Pentaho Enterprise Edition</a>: Save time, resources, money and
				mitigate risk. <br />
				&#169; 2005-<%= year %> Pentaho Corporation. All rights reserved.</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</body>


<script language='javascript' src='mantleLogin/mantleLogin.nocache.js'></script>

</html>
<%!// reads the exception stored by AbstractProcessingFilter
	private String getUserMessage(final AuthenticationException e) {
		String userMessage = Messages
				.getString("UI.USER_LOGIN_FAILED_DEFAULT_REASON");
		if (null != e) {
			String errorClassName = e.getClass().getName();
			errorClassName = errorClassName.replace('.', '_');
			errorClassName = errorClassName.toUpperCase();
			String key = "UI.USER_LOGIN_FAILED_REASON_" + errorClassName;
			String tmp = Messages.getString(key);
			if (null != tmp && 0 != tmp.length() && !tmp.startsWith("!")) {
				userMessage = tmp;
			}
		}
		return userMessage;
	}%>
