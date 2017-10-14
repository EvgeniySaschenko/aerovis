<?php
	if(($_GET['action'] == 'charter-fligts')){

		$to= 'charter@aerovis.aero';
		$subject= 'Order charter - '.$_POST['name_user'].' - contry '.$_POST['region']; 
		$message= "<b>Message:</b><br> ".$_POST['message']. "<br>".
		"<b>Sender name:</b> ".$_POST['name_user']. "<br>".
		"<b>Contry:</b> ".$_POST['region']. "<br>".
		"<b>Mail:</b> ".$_POST['mail']. "<br>".
		"<b>Sent from site:</b> ".$_SERVER['HTTP_HOST']. "<br><br>".
		"Sincerely, <br> Airline Aerovis <br>";
		$headers = 'From: AeroVis <dispatch@'.$_SERVER['HTTP_HOST'].'>' . "\r\n";
		$headers .= 'Content-type: text/html; charset="utf-8"';

		mail($to, $subject, $message, $headers); 
		mail($_POST['mail'], $subject, $message, $headers);
	}

	if(($_GET['action'] == 'contacts')){
		
		$to= 'office@aerovis.aero';
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