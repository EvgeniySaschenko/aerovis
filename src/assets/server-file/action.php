<?php
	if(($_GET['action'] == 'charter-fligts')){

		$to= 'evgeniy.saschenko@gmail.com';
		$subject= 'Order charter - '.$_POST['name_user'].' - route '.$_POST['region_of'].' - '.$_POST['region_in'].' - date '.$_POST['date']; 
		$message= "<b>Message:</b><br> ".$_POST['message']. "<br>".
		"<b>Sender name:</b> ".$_POST['name_user']. "<br>".
		"<b>Route:</b> ".$_POST['region_of'].' - '.$_POST['region_in']. "<br>".
		"<b>Airport:</b> ".$_POST['airport_of'].' - '.$_POST['airport_in']. "<br>".
		"<b>Cargo:</b> ".$_POST['cargo']. "<br>".
		"<b>Weight:</b> ".$_POST['weight']. "<br>".
		"<b>Date:</b> ".$_POST['date']. "<br>".
		"<b>Mail:</b> ".$_POST['mail']. "<br>".
		"<b>Sent from site:</b> ".$_SERVER['HTTP_HOST']. "<br><br>".
		"Sincerely, <br> Airline Aerovis <br>";
		$headers = 'From: AeroVis <dispatch@'.$_SERVER['HTTP_HOST'].'>' . "\r\n";
		$headers .= 'Content-type: text/html; charset="utf-8"';

		mail($to, $subject, $message, $headers); 
		mail($_POST['mail'], $subject, $message, $headers);
	}

	if(($_GET['action'] == 'contacts')){
		
		$to= 'evgeniy.saschenko@gmail.com';
		$subject= 'Contacts - '.$_POST['name_user']; 
		$message= "<b>Message:</b><br> ".$_POST['message']. "<br>".
		"<b>Sender name:</b> ".$_POST['name_user']. "<br>".
		"<b>Mail:</b> ".$_POST['mail']. "<br>".
		"<b>Sent from site:</b> ".$_SERVER['HTTP_HOST']. "<br><br>".
		"Sincerely, <br> Airline Aerovis <br>";
		$headers = 'From: AeroVis <dispatch@'.$_SERVER['HTTP_HOST'].'>' . "\r\n";
		$headers .= 'Content-type: text/html; charset="utf-8"';

		mail($to, $subject, $message, $headers); 
		mail($_POST['mail'], $subject, $message, $headers);
	}
?>