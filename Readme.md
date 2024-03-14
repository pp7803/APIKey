<p align="center">
  <font size="4">
    <b>USAGE</b>
  </font>
</p>
<div style="background-color: #; color: #ffffff; padding: 10px; border-radius: 5px;">
<pre>

 
    PPAPIKey *apikey = [[PPAPIKey alloc] init];
    [apikey setToken:NSSENCRYPT("")];

    //Content
    [apikey setSubmitContent:NSSENCRYPT("Sumbit")];
    [apikey setContactContent:NSSENCRYPT("Contact")];
   
    [apikey paid:^{
        //Hàm gọi menu(nếu có)
    }];

</pre>

<p align="center"><b>Auth Alert!</b></p> 

![alt text](images/enterkey.png "")


</div>
<p align="center">
  <font size="6">
    <b>AUTH IMAGES</b>
  </font>
</p>

<p align="center"><b>Login Success!</b></p> 

<table style="width:100%">
  <tr>
    <td align="center">
      <figure>
        <img src="images/successen.png" alt="alt text" width="100%">
        <figcaption>EN</figcaption>
      </figure>
    </td>
    <td align="center">
      <figure>
        <img src="images/successvi.png" alt="alt text" width="100%">
        <figcaption>VI</figcaption>
      </figure>
    </td>
  </tr>
</table>

<p align="center"><b>Incorrect Key!</b></p>

<table style="width:100%">
  <tr>
    <td align="center">
      <figure>
        <img src="images/saikeyen.png" alt="alt text" width="100%">
        <figcaption>EN</figcaption>
      </figure>
    </td>
    <td align="center">
      <figure>
        <img src="images/saikeyvi.png" alt="alt text" width="100%">
        <figcaption>VI</figcaption>
      </figure>
    </td>
  </tr>
</table>

<p align="center"><b>Lock Device!</b></p>

<table style="width:100%">
  <tr>
    <td align="center">
      <figure>
        <img src="images/khoaen.png" alt="alt text" width="100%">
        <figcaption>EN</figcaption>
      </figure>
    </td>
    <td align="center">
      <figure>
        <img src="images/khoavi.png" alt="alt text" width="100%">
        <figcaption>VI</figcaption>
      </figure>
    </td>
  </tr>
</table>

<p align="center"><b>Lock Package</b></p>

<table style="width:100%">
  <tr>
    <td align="center">
      <figure>
        <img src="images/khoaappen.png" alt="alt text" width="100%">
        <figcaption>EN</figcaption>
      </figure>
    </td>
    <td align="center">
      <figure>
        <img src="images/khoaappvi.png" alt="alt text" width="100%">
        <figcaption>VI</figcaption>
      </figure>
    </td>
  </tr>
</table>
