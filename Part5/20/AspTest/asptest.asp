<HTML>
<BODY>
<TITLE> Testing Delphi ASP </TITLE>
<CENTER>
<H3> Testing Delphi ASP <br> This is AspTest from Mastering Delphi </H3>
</CENTER>
<HR>
<h4>Message</h4>
<% Set DelphiASPObj = Server.CreateObject("asptest1.asptest") 
   DelphiASPObj.showData
%>
<HR>
<h4>hello</h4>
<% 
   Session.Value("UserName") = "Marco"
   DelphiASPObj.Hello
 %>
<HR>

<h4>database</h4>
<% 
   DelphiASPObj.ShowTable
%>

</BODY>
</HTML>