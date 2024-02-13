<p align="center">
  <font size="4">
    <b>USAGE</b>
  </font>
</p>
<div style="background-color: #; color: #ffffff; padding: 10px; border-radius: 5px;">
<pre>
//Custom in Key.xm
token = NSSENCRYPT("a2fa40c2a0e5a79d17268335480f099cb47319ab");
tieudealert= NSSENCRYPT("Your alert title"); //Tiêu đề bảng nhập key
messageinfo = NSSENCRYPT("YourToastMessage");//Thong báo nổi
urlContact = NSSENCRYPT("https://www.facebook.com/abc");//Liên kết MXH
isContact = YES;  //đặt là NO/YES nếu bạn không muốn/muốn hiện nút contact
submit=NSSENCRYPT("Submit");// Nội dung nút Submit
contact=NSSENCRYPT("Contact");  //Nội dung nút liên hệ
</pre>

<p align="center"><b>Example!</b></p> 

![alt text](images/ex.png "")


</div>
<p align="center">
  <font size="6">
    <b>ẢNH MINH HỌA API SERVER</b>
  </font>
</p>

<p align="center"><b>Login Success!</b></p> 

![alt text](images/success.png "")

<p align="center"><b>Incorrect Key!</b></p>

![alt text](images/fail1.png "")

<p align="center"><b>Lock Device!</b></p>

![alt text](images/fail2.png "")

<p align="center"><b>Lock Package</b></p>

![alt text](images/fail3.png "")
