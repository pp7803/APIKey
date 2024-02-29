<p align="center">
  <font size="4">
    <b>USAGE</b>
  </font>
</p>
<div style="background-color: #; color: #ffffff; padding: 10px; border-radius: 5px;">
<pre>

 
    PPAPIKey *apikey = [[PPAPIKey alloc] init];
    [apikey setToken:NSSENCRYPT("")]; 
    [apikey setAlertTitle:NSSENCRYPT("Title1")];
    [apikey setAlertTitle2:NSSENCRYPT("Title2")];

    [apikey setShowToast:YES];//If setShowToast=YES, Edit messageinfo, if NO, No Neeed edit
    [apikey setMessageinfo:NSSENCRYPT("YourToastMessage")];

    [apikey setIsContact:YES];//If setIsContact=YES, Edit urlContact, if NO, No Neeed edit
    [apikey setURLContact:NSSENCRYPT("https://facebook.com/pp.7803")];

    //Content
    [apikey setSubmitContent:NSSENCRYPT("Sumbit")];
    [apikey setContactContent:NSSENCRYPT("Contact")];
  
    [apikey paid:^{
        //Hàm gọi menu(nếu có)
    }];

</pre>

<p align="center"><b>Example!</b></p> 

![alt text](images/ex1.png "")
![alt text](images/ex2.png "")


</div>
<p align="center">
  <font size="6">
    <b>AUTH IMAGES</b>
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
