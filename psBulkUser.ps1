Import-Module ActiveDirectory 

$NewUsers = Import-Csv new-users.csv 

 

foreach ($NewUser in NewUsers) 

{ 

    $Username = $NewUser.username 

    $Password = $NewUser.password 

    $FirstName = $NewUser.firstname 

    $LastName = $NewUser.lastname 

    $OU = $NewUser.ou 

 

    if (Get-ADUser -F {SamAccountName -eq $Username}) 

    { 

     

        Write-Warning "$Username kullanıcı adı kullanımda"  

     

    } 

    else 

    { 

        New-ADUser ` 

            -SamAccountName $Username ` 

            -UserPrincipalName $Username@zafer.local ` 

            -Name "$FirstName LastName" ` 

            -GivenName $Firstname ` 

            -Surname $LastName ` 

            -Enabled $True ` 

            -DisplayName "$Lastname, $Firstname" ` 

            -Path $OU 

 

    } 
