LoginRadius's Classic ASP SDK is used to implement Social Login on your Classic ASP website
========

Description: LoginRadius's Classic ASP SDK is a development kit that lets you integrate Social Login through providers such as Facebook, Google, Twitter, and over 20 more on a PHP website. The SDK also fetches user profile data and can be customized from your LoginRadius user account. Ex: social icon sets, login interface, provider settings, etc.

Steps to implement LoginRadius Classic ASP SDK
===

Step 1: Add SDK file reference to your Classic ASP project directory
 
 a. Copy the LoginRadius SDK with json file to your project directory
 
 b. Include SDK class file on your callback page.
 
      <!-- #include file="LoginRadius.asp" -->

Step 2: Call LoginRadius function with your unique API secret key

    <% LoginRadius("Your API Secret key goes here") %>
    
Step 3: Validate, authenticate and store data from LoginRadius:

Validate the object using 'IsAuthenticat' variable. After successful validation, access user profile data such as ID, First Name, Last Name, Email using UserProfile.ID, UserProfile.FirstName, UserProfile.LastName, etc.

       <% 
      If(IsAuthenticat) then
        Response.Write("ID : " & UserProfile.ID & "<br>")
        if IsObject(UserProfile.Country) then
          Response.Write("Country Code : " & UserProfile.Country.Code & "<br>")  
          Response.Write("Country Name : " & UserProfile.Country.Name & "<br>")
        End If
        
        if IsObject(UserProfile.Email) then  
          For Each email in UserProfile.Email  
            Response.Write("Email ID : " & email.Value & "<br>")  
          Next
        End If
        
        Response.Write("First Name : " & UserProfile.FirstName & "<br>")  
        Response.Write("Full Name : " & UserProfile.FullName & "<br>")  
        Response.Write("Gender : " & UserProfile.Gender & "<br>")  
        Response.Write("Last Name : " & UserProfile.LastName & "<br>")  
        Response.Write("Middle Name : " & UserProfile.MiddleName & "<br>")  
        Response.Write("Nick Name : " & UserProfile.NickName & "<br>")  
        Response.Write("Prefix : " & UserProfile.Prefix & "<br>")  
        Response.Write("Profile Name : " & UserProfile.ProfileName & "<br>")  
        Response.Write("Provider : " & UserProfile.Provider & "<br>")  
        Response.Write("Suffix : " & UserProfile.Suffix & "<br>")   
        End If
      %>

Note: Few providers like Twitter, vkontakte, etc. doesn't provide email address with User Profile data, so you need to handle these cases in your callback page.

These are the quick and easy steps to integrate Social Login on your Classic ASP website, if you have any questions or need a further assistance please contact us at hello@loginradius.com.
