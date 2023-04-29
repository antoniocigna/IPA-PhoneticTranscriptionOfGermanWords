"use strict";
/*  
RaS: A tool to practice language comprehension
Antonio Cigna 2023
license MIT: you can share and modify the software, but you must include the license file 
*/ 
/* jshint strict: true */
/* jshint esversion: 6 */
/* jshint undef: true, unused: true */	 
//---------------------------------------------------------


var word_separator = ".,.;:?!_+-\[\]\(\)"  + "\t\n\r" ;  // word separator characters 

//----------------------------------------------------
// This function returns an XML string with all the messages from the application.
// xml doesn&apos;t accept &apos;<&apos; and &apos;&&apos; characters,
// but here you can use the following html markup: <br><b></b> <ul><li></li></ul>
// and the following characters: & &apos; "
//-----
// If you want to edit a message you need to edit this file only (the texts in the html file are just for reminder).
// You can add any language using the English part as a base, as long as you change the first 2 lines and the last one appropriately:
//    <lang_xx> </lang_xx> where xx is the language identifier.
//    <id_language>xx</id_language>
//    <lang_name>Name of the language</lang_name> This line is never used in any script it is only used as a comment.
// The language used by the script is determined by the local language of the computer.
// The script gets the local language identifier, looks for the corresponding part in this file, if it can&apos;t find it, use the English one.
// for example: the identifier is fr, since the French part is missing (lang_fr) the English one (lang_en) is used.
//----
// The message id has the form <Dm...></Dm...>  
// where the first character can be one of A, B, C
//    A  message for  cbc_builder.html file    
//    B  message for  cbc_player.html file    
//    C  message for  cbc_Player_Words_ClipByClip.html file    
//    H  message for  ...  DOC/DOC_english/doc_en.html     
//    S  message for  ...  SRT_v2_from_TEXT.html

// The m... following A,B,C is the id  of the html element that will receive the message text (eg. id="m123")   
//
//----------------------------------------------------------------------------------------------------------------------------------------
// Questa funzione restituisce una stringa XML con tutti i messaggi dell&apos;applicazione. 
// xml non accetta i caratteri &apos;<&apos; e &apos;&&apos;,
// ma qui puoi usare i seguenti marcatori html: <br><b></b> <ul><li></li></ul>
// e i seguenti caratteri: & &apos; "
//-----
// Se vuoi modificare un messaggio devi modificare soltanto questo file (quelli nel file html servono soltanto come promemoria)
// Puoi aggiungere qualsiasi lingua usando come base la parte inglese, a patto di modificare opportunamente le prime 3 righe e l&apos;ultima:
//    <lang_xx>   </lang_xx>   dove xx è l&apos;identificatore della lingua.
//    <id_language>xx</id_language>
//    <languageName>Nome della lingua usata</languageName>  Questa riga non  è mai usata in nessuno script serve soltanto come commento.
// La lingua utilizzata dallo script è determinata dalla lingua locale del computer.
// Lo script ottiene l&apos;identificativo xx della lingua locale, cerca la parte corrispondente in questo file, 
// se non la trova, utilizza quella in inglese.
// per esempio: l&apos;identificativo è fr, poiché manca la parte francese (lang_fr) viene utilizzata quella inglese (lang_en).
//----
// L&apos;id del messaggio ha la forma <Dm...></Dm...>
// dove il primo carattere può essere A, B, o C
// 		A messaggio per il file cbc_builder.html
//      B messaggio per il file cbc_player.html
//      C messaggio per il file cbc_Player_Words_ClipByClip.html
// La m... che segue A,B,C è l&apos;id dell&apos;elemento html che riceverà il testo del messaggio  (es. id="m123")
//               
//---------------------------------------------------------------------------------------------------------------------------------------

function get_messages() {

	var xml_text = `
<messages>
	<lang_en>		
		<id_language>en</id_language>	
		<languageName>English</languageName>	
		
		<Afile>cbc_builder.html</Afile>
		<Ama20>title is missing</Ama20>		
		<Ama21>the original subtitle file has not been read yet or is empty</Ama21>	
		<Ama22>the text in source language is missing</Ama22>	
		<Ama23>the translated text is missing</Ama23>	
		<Ama24>a text file is useless, a subtitle file is needed</Ama24>
		<Ama25>The file <b>§file§</b> content is not in srt subtitle format</Ama25>
		<Ama26>but if that's ok, in the <b>§m705§</b> window write 3 dots in a row <b>§...§</b></Ama26>  
		<Ama30>seconds without dialogue</Ama30>	
		<Amh00>../DOC/doc_English/doc_en.html</Amh00>			
		<Am001>after you have pressed the key below,
			<br>before clicking on the name of the chosen file,
			<br>select and copy the full address of the folder that contains it (you&apos;ll have to paste it right after)
		</Am001>
		<Am002>Choose video or audio file</Am002>
		<Am003>Confirm or make a new choice</Am003>
		<Am004>Confirm</Am004>
		<Am005>File Name</Am005>
		<Am006>Go back</Am006>		
		<Am007>Does the original language subtitle file exist?</Am007>
		<Am008>Yes, it exists</Am008>
		<Am009>No, it doesn't exist</Am009>		
		<Am010>The input consists of a video or audio file, a text or subtitle file in the original language and translated
			<br>one or more files may be missing
		</Am010>
		<Am011>Is there a video or audio file to play? </Am011>
		<Am012>Yes, there is a video or audio file </Am012>
		<Am013>No, there is neither a video file nor an audio file</Am013>
		<Am014>but there is a text file</Am014>
		<Am015>the file type of the original text <b>§origtype§</b> 
			is not the same as that of the translated text <b>§trantype§</b>
		</Am015>
		<Am138> Download</Am138>
		<Am139> Two files will be downloaded in the system download folder. 
			<br> Press the button here below to download the first file (it contains all the subtitles)
			</Am139>
		<Am140> Download script file</Am140>
		<Am141> Download html file</Am141>
		<Am142> After the previous download has been completed, press the button below. <br>
			<br>Immediately after, the newly built application is ready for use.
			<br><br>It can be re-run as many times as you want<br> by clicking on the CBC_1 _..... html file 
			<br> The two files (script and html) can be moved to any other folder, but they must always stay together. <br> <br>
			</Am142>
		<Am143> Download the html file</Am143>			
		<Am157> paste here below the path to the selected file</Am157>
		<Am158> Confirm</Am158>
		<Am159> Confirm</Am159>
		<Am160> Confirm</Am160>		
		<Am161> Write the title</Am161>
		<Am700> A tool to  <br>improve foreign language comprehension</Am700>
		
		<Am704> Source Language Subtitles</Am704>
		<Am705> Translated Subtitles</Am705>
		<Am706> make subtitles and write new file</Am706>
		<Am714> Source Language text</Am714>
		<Am715> Translated text</Am715>
		
		
		<Am875> Video/Audio Folder</Am875>				
		<Amb64>is not text</Amb64>									
		<Amb65>is not a text file</Amb65>		
		<Amb67> select the subtitles files and then <br>click here below<br> to download the two files</Amb67>		
		<Amb68> select the subtitles files and then <br>click here below<br> to download the two files</Amb68>	
			<Cfile>cbc_Player_Words_ClipByClip.html</Cfile>
		<Cm001>ERROR</Cm001>
		<Cm002>This html file has no parameters to use.</Cm002>
		<Cm003>It appears to have been started by clicking on it or typing its name on the command line,
				<br>but he can&apos;t go alone (he lacks the data to use).
		</Cm003>
		<Cm004>Must be called from a file created by <b>ClickByClip_builder.html</b>.</Cm004>
		<Cm500>Words</Cm500>
		<Cm501>DOC/shared/cbc_4_HELP.html?language=en</Cm501>
		<Cm502>$numwords$ words ($percSingle$%) form the <b>$percX$% of the text</b></Cm502>
		<Cm503>This word is found in $numlines$ lines (Click on the yellow button to execute the first line)</Cm503>
		<Cm504>All subtitle words are listed as buttons here on the right in reverse order of frequency, from most to least referenced.</Cm504>
		<Cm505>By clicking on a button that contains a word, it is possible to reproduce all the lines of subtitles that contain it</Cm505>
		<Cm507>change begin time</Cm507>
		<Cm508>change end time</Cm508>
		<Cm509>The word is in the lines identified by the numbers listed below it<br>
		(you can reproduce a row after the other by clicking on the <b>play +</b> button,  <br>  
		or you can click on any of the number listed and then on the <b>repeat</b> button)
		</Cm509>
		<Cm510>Play + <br>line</Cm510>
		<Cm511>Repeat<br>line</Cm511>
		<Cm512>Show Original Subtitles</Cm512>
		<Cm513>Show Translated Subtitles</Cm513>
		<Cm514>Repeat endlessly<br>line</Cm514>		
		<Cm515>rows</Cm515>		
		<Cm516>row</Cm516>		
		<Cm604>All the words of the text are listed as buttons here on the right in reverse order of frequency, from most to least referenced.</Cm604>
		<Cm605>By clicking on a button showing a word it is possible to read all the lines that contain it</Cm605>	
		<Cm609>The word is found in the lines identified by the numbers listed below it<br>
			to read a row click on the corresponding number or <br>
			to go from one to the next, click on the <b>Go to line</b> button
		</Cm609>
		<Cm610>Go to <br>line</Cm610>
		<Cm611>Show<br>line</Cm611>
		<Cm612>Show Original Text Line</Cm612>
		<Cm613>Show Translated Text Line</Cm613>	
		<Cmt01>Text to speech</Cmt01>	
		<Cmt02>Select Voice</Cmt02>	 
		<Cmt03>Volume</Cmt03>	
		<Cmt04>Rate	</Cmt04>		
		<Cmt05>Pitch</Cmt05>	
		<Dmh00>../DOC/doc_English/doc_en.html</Dmh00>	
		<Dfile>ras_PLAYER.html</Dfile>
		<Dm001>ERROR</Dm001>									
		<Dm002>This html file has no parameters to use.</Dm002>		
		<Dm003>It appears to have been started by clicking on it or typing its name on the command line,									
				<br>but he can&apos;t go alone (he lacks the data to use).									
		</Dm003>									
		<Dm004>Must be called from a file created by <b>ClickByClip_builder.html</b>.</Dm004>									
		<Dm010>how much are you working with this file</Dm010>									
		<Dm011>Session<br>&nbsp;</Dm011>									
		<Dm012>num.<br>days</Dm012>									
		<Dm013>num.<br>sessions</Dm013>									
		<Dm014>num.<br>clips</Dm014>									
		<Dm015>time<br>usage</Dm015>									
		<Dm017>this session</Dm017>									
		<Dm018>all sessions</Dm018>									
		<Dm019>num.<br>sub.lines</Dm019>									
		<Dm020>num.<br>words</Dm020>									
		<Dm021>the dialogue ends with</Dm021>									
		<Dm022>seconds and sentence completion</Dm022>									
		<Dm023>seconds and to the end of any overlapping entries</Dm023>									
		<Dm024>Play the entire clip</Dm024>								
		<Dm026>Translation of the line being played</Dm026>									
		<Dm033>Hide the clip&apos;s subtitles</Dm033>									
		<Dm034>Play the entire clip</Dm034>									
		<Dm035>Show all subtitles</Dm035>									
		<Dm036>Hide all subtitles</Dm036>									
		<Dm037>show</Dm037>									
		<Dm038>hide</Dm038>									
		<Dm039>translation of the last line</Dm039>	
		<Dm040>Change the speed</Dm040>									
		<Dm100>Specify clip type and duration</Dm100>									
		<Dm101>Change the duration of the clips</Dm101>									
		<Dm103>seconds</Dm103>									
		<Dm104>seconds and dialogue completion</Dm104>									
		<Dm105>seconds and line completion</Dm105>									
		<Dm106>lines of subtitles</Dm106>									
		<Dm107>Play</Dm107>									
		<Dm108>a new Clip</Dm108>									
		<Dm109>Change<br>type and duration</Dm109>									
		<Dm110>Synchronization</Dm110>									
		<Dm111>Subtitles</Dm111>									
		<Dm112>Change<br>duration</Dm112>									
		<Dm113>Reset</Dm113>									
		<Dm114>Pause<br>Continue</Dm114>									
		<Dm115>show all subtitles</Dm115>									
		<Dm116>hide all subtitles</Dm116>										
		<Dm218>Meaning of the buttons</Dm218>									
		<Dm119>press to establish start of row selection</Dm119>									
		<Dm120>press to establish end of row selection</Dm120>									
		<Dm121>press to play</Dm121>									
		<Dm122>press to play and then repeat indefinitely</Dm122>			
		<Dm126>Duration of a Clip</Dm126>									
		<Dm501>DOC/shared/cbc_4_HELP.html?language=en</Dm501>						
		<Dm145>reset</Dm145>									
		<Dm146>restores the initial text and background colors</Dm146>									
		<Dm147>choose the background color</Dm147>									
		<Dm148>choose text color</Dm148>									
		<Dm149>automatic search for the text color that best matches the background</Dm149>									
		<Dm167>the line is visible, press to hide it</Dm167>									
		<Dm168>the row is invisible, press to make it visible </Dm168>									
		<Dm169>the translation is hidden, press to make it visible</Dm169>									
		<Dm170>the translation is visible, press to hide it </Dm170>									
		<Dm171>Fix line start or end time</Dm171>									
		<Dm201>Colors</Dm201>									
		<Dm202>Change Colors</Dm202>									
		<Dm204>Background</Dm204>									
		<Dm205>Text</Dm205>									
		<Dm206>Text</Dm206>									
		<Dm207>automatic</Dm207>									
		<Dm208><br>The <b>Contrast</b>between the background and text colors is</Dm208>									
		<Dm209>good</Dm209>									
		<Dm210>insufficient</Dm210>		
		<Dm211>change the color of the background or text<br>or press the <b>auto.</b>key									
			<br>to automatically search for the most suitable text color									
		</Dm211>									
		<Dm212>I&apos;m looking for the best color</Dm212>									
		<Dm213>Statistics</Dm213>		
		<Dm220>select start</Dm220>
		<Dm221>select end</Dm221>
		<Dm222>show / hide<br>subtitles</Dm222>
		<Dm223>show / hide<br>translation</Dm223>
		<Dm224>Subtitles</Dm224>
		<Dm225>Play once</Dm225>
		<Dm226>Play endlessly</Dm226>
		<Dm227>N.</Dm227>
		<Dm228>from</Dm228>
		<Dm229>to</Dm229>
		<Dm230>maximum number of <br>seconds of sliding<br></Dm230>
		<Dm231>slide the cursor left or right<br>to bring forward <br>or delay<br>the beginning of the line</Dm231>
		<Dm232>slide the cursor left or right<br>to bring forward <br>or delay <br>the end of the line</Dm232>		
		<Dm244><b>To synchronize subtitles with speech</b></Dm244>	
		<Dm245><ul><li>Select a group of subtitle lines (keys <b>&#8594; &nbsp; &#8592;</b>),
			</li><li>make sure the subtitles are visible (open book &#128214;)
			</li><li>click the talking head icon &#128483; to start playback.
			</li><li>as soon as any line of subtitles has been fully spoken press the <b>Stop</b> key
			</li><li>If it is difficult to stop playback at the exact point, decrease the speed (vertical slider to the right) and try again.
			</li><li>After the stop, a box will open where you will have to indicate this last talked line.
			</li><li>At this point the correction will have been made and
			it will remain active in subsequent sessions (even after restarting the computer).
			</li><li>To close this window press the <b>Sync.OK</b> button. </li></ul>
		</Dm245>
		<Dm300>Words</Dm300>	
		<Dm302>Printable Bilingual</Dm302>		
		<Dm303>Printable Text</Dm303>	
		<Dm324>Text Lines</Dm324> 	
		<Dm400><b>To synchronize subtitles with speech</b></Dm400>
		<Dm401><ul><li>Select a group of subtitle lines </li></ul></Dm401>
		<Dm402>Practice<br>by listening and reading<br>only a few subtitle lines at time</Dm402>
		<Dm403>Practice<br>by listening<br>only a few seconds at a time</Dm403>
		<Dm404>Practice<br>by listening (synthetic voice) and reading </Dm404>
		<Dm405>Rate</Dm405> 
		<Dm406>end time</Dm406>
		<Dm407>seconds</Dm407>
		<Dm408>since the <br>second</Dm408>
		<Dm409>per <br>second</Dm409>
		<Dm410>text</Dm410>
		<Dm411>Subtitles</Dm411>			
		<Dm412>Press the button of the line that ends with the last word spoken</Dm412>
		<Dm413>subtitle lines</Dm413>
		<Dm414>subtitle line</Dm414>
		<Dm415>show all subtitles</Dm415>							
		<Dm416>hide all subtitles</Dm416>
		<Dm417>increased by</Dm417>
		<Dm418>decreased by</Dm418>
		<Dm419>Bilingual Text</Dm419>	
		<Dm420>spoken in</Dm420>	
		<Dm421>text</Dm421>
		<Dm422>Play the chosen voice</Dm422>                          
        <Dm423>Play a voice in turn</Dm423>    
		<Dm424>Play pause between words</Dm424>
        <Dm425>N.</Dm425>	
		<Dm426>Pitch</Dm426>
		<Dm427>Speed</Dm427>
		<Dm428>Pause</Dm428>
		<Dm429>Resume</Dm429>
		<Dm430>Cancel</Dm430>		
		<Dm431>Go Back</Dm431>  		
		<Dm432>the text in source language is missing</Dm432>	
		<Dm433>the translated text is missing</Dm433>	
		<Dm434>but if that's ok, write 3 dots in a row <b>§...§</b></Dm434>  	
		<Dm435>Select the first voice to read the text</Dm435>
		<Dm436>the other voices in the same language will read in turn</Dm436>
		<Dm437>continue</Dm437>
		<Dm438>§1§ text</Dm438>
		<Dm439>specify the maximum line length</Dm439>
		<Dm440>continue</Dm440>
		<Dm441>oral comprehension</Dm441>	

		<Dm452>language</Dm452>
		<Dm453>voice</Dm453>			
		<Dm454>continue</Dm454>		
		<Dm455>select start</Dm455>
		<Dm456>select end</Dm456>
		<Dm457>show / hide<br>text</Dm457>
		<Dm458>show / hide<br>translation</Dm458>	
<Dm461>Select a voice</Dm461>			
		<Dm463>word<br>by<br>word</Dm463>	
		<Dm464>A tool to <br>improve foreign language §oralcomprehension§</Dm464>	
		<Dm465>by listening to a text <br>read one line at time, one word at time
			<br><br>at each click the row or word is read by the indicated voice
			<br>even at reduced speed if required
		</Dm465>	
		<Dm466>Paste the <b>§1§</b> text here below</Dm466>		
		<Dm467>Paste the line by line translation here below </Dm467>
		<Dm468>(if it doesn't exist write 3 dots ...)</Dm468>		
		<Dm470>subtitle §r1§</Dm470>
		<Dm471>word §w1§</Dm471>
		<Dm472>real voice</Dm472>
		<Dm473>Synthetic voices</Dm473> 

		<Dm711>Text Lines</Dm711>
		<Dm715>show all lines</Dm715>
		<Dm716>hide all lines</Dm716>
		<Dm717>list all lines</Dm717>		
		<Dm731>go to beginning of lines in original language</Dm731>
		<Dm732>go to beginning of translated lines</Dm732>
		<Dm782>Show the <b>Subtitles</b>of the line being played</Dm782>									
		<Dm783>Show the <b>Translation</b>of the line being played</Dm783>			
		<Dm791>Original text</Dm791>
		<Dm792>Translated text</Dm792>							
		<Dm846>Skip</Dm846>					
		<Dm893>The translated line should only serve to get an idea of the meaning.<br>
			<b>Line-by-line translation is generally unreliable.</b>
		</Dm893>
		<Dm894>Click on <b>t?</b> button to read the subtitles	</Dm894>	
		<Dm895>Practice<br>by listening and reading<br>only a few subtitle lines at time</Dm895>
		<Dm896>Practice<br>by listening<br>only a few seconds at a time</Dm896>
		<Dm897>Practice<br>by listening (synthetic voice) and reading <br>only a few text lines at time</Dm897>
		<Dm900>Wait a moment, please<br></Dm900> 
		<Dma06>Confirm</Dma06>									
		<Dma10>Press to download</Dma10>									
		<Dma12>title</Dma12>			
		<Dma17><b>This is the subtitle area</b>,<br>you can move it by dragging the anchor									
			<br>(click on the anchor and hold down and move the mouse)									
			<br>You can change the size of this strip<br>by dragging the blue square .									
		</Dma17>									
		<Dma18>You need to move the downloaded file from the download folder to the <b>ClipByClip/PLAYER</b></Dma18>									
		<Dma20>title is missing</Dma20>									
		<Dma21>the original subtitle file has not been read yet or is empty</Dma21>									
		<Dma24>error1 in previous step: Aspectless format line in extract_time(</Dma24>									
		<Dma25>error2 in previous step: Aspectless format line in extract_time(</Dma25>									
		<Dma26>error3 in extract_time()</Dma26>									
		<Dma30>seconds without dialogue</Dma30>									
		<Dma50>Select one or more files.</Dma50>									
		<Dma52>cannot be played</Dma52>									
		<Dma80>Show</Dma80>									
		<Dma81>Hide</Dma81>									
		<Dmb07>or </Dmb07>									
		<Dmb10>The video or audio files to be played must be located in the <b>ClipByClip/VideoAudio</b></Dmb10>									
		<Dmb12>VIDEO or Audio file</Dmb12>									
		<Dmb13>Select another Video or Audio file in the <b>ClipByClip/VideoAudio</b></Dmb13>									
		<Dmb22>to improve listening and reading comprehension of a foreign language</Dmb22>									
		<Dmb23>to improve listening and reading comprehension of a foreign language</Dmb23>									
		<Dmb50>Error<br>the file is neither video nor audio</Dmb50>		
		<Dmb52>can&apos;t be played</Dmb52>								
		<Dmb62>the file to run</Dmb62>									
		<Dmb64>is not text</Dmb64>									
		<Dmb65>is not a text file</Dmb65>									
		<Dmb67>Specify the subtitle files to use and then <br>click below<br>to download the two files</Dmb67>									
		<Dmb68>Specify the subtitle files to use and then <br>click below<br>to download the two files</Dmb68>									
		<Dmb71>encoded in the video file</Dmb71>									
		<Dmb74><b>The folder name and path must be the same as those containing the file </b></Dmb74>									
		<Dmb77>has been downloaded to your download folder</Dmb77>									
		<Dmb78>To be able to run it, change the final part of the name to <b>.html</b></Dmb78>									
		<Dmb79>This file can be moved and executed in any folder on your computer</Dmb79>									
		<Dmb81>the file</Dmb81>									
		<Dmb83>end time</Dmb83>									
		<Dmb84>seconds</Dmb84>									
		<Dmb85>since the <br>second</Dmb85>									
		<Dmb86>per <br>second</Dmb86>									
		<Dmb89>text</Dmb89>									
		<Dmb90>Press the button of the line that ends with the last word spoken</Dmb90>									
		<Dmb91>subtitle lines</Dmb91>									
		<Dmc85>subtitle line</Dmc85>									
		<Dmc86>increased by</Dmc86>									
		<Dmc87>decreased by</Dmc87>	
		<Dmc88>Bilingual Text</Dmc88> 	
		<Dmt01>Text to speech</Dmt01>	
		<Dmt02>Select Voice</Dmt02>	 
		<Dmt03>Volume</Dmt03>	
		<Dmt04>Rate	</Dmt04>		
		<Dmt05>Pitch</Dmt05>		
	??????????????????????????




????????????????????????	
	
		<Hfile>doc/helpxx.html</Hfile>
		<Hm800><b>ClipByClip</b> is a tool to practice the comprehension of a language.</Hm800>
		<Hm820>It can be used in active mode by listening, reading and repeating 
				<br>or in passive mode by endlessly listening to a few lines of subtitles while busy doing something else.
				<br>It can also be useful in your native language to memorize for instance a poem, a piece of prose or a list of terms. 
		</Hm820>			
		<Hm812>The following could be a possible exploitation of the tool</Hm812> 
		<Hm801>Select a few lines of subtitles to play 
			by clicking on the §arrowRight§ icon of the first line and the §arrowLeft§ of the last line. 
		</Hm801> 
		<Hm802>Hide these lines (click to change the §openedbook§ icon to §closedBook§) and 
			play them once (click on the §talkingHead§ icon) or several times (§infinity§ icon).
		</Hm802>
		<Hm803>If it&apos;s useful you can reduce the playback speed (vertical slider).</Hm803>
		<Hm804>Try to repeat what you hear</Hm804> 
		<Hm805>Show the lines (click to change the  the §openedbook§ icon to §closedBook§) and play them again.</Hm805>
		<Hm806>To see the translation click on the §hideTran§ icon to change it to §showTran§.</Hm806>
		<Hm807>You can play and practice a line at time</Hm807>
		<Hm808>Of course you can just  enjoy the video as usual from the beginning to the end with or without subtitles.</Hm808>
		<Hm809>To watch the film without interruptions click on the button with the little arrow which is just below the video. </Hm809>
		<Hm810>To read the subtitles in the original language, click on the §closedBook§ icon and to hide them click on the §openedbook§.</Hm810>
		<Hm811>To read the translated subtitles, click on the §hideTran§ icon and to hide them click on the §showTran§ icon. </Hm811>		
		<Hm813>To select some lines of subtitles to play click on the §arrowRight§ icon of the first line 
			and the §arrowLeft§ of the last line.<br>Two highlighted stripes will appear before the first line and after the last.
			<br>The buttons on the new line before the first have effect on all the selected lines 
			(eg. clicking on the §talkingHead§ playbacks all the selected lines). </Hm813>    
		<Hm814>You can know when a subtitle is playing even when it is invisible,
			because in this case the line containing it is framed by a red border.
		</Hm814>	
		<Hm815>You can show, hide and play a single line inside a selected group</Hm815>
		<Hm816>This page is called up by the button <b>Words in reverse order of use</b>.
			<br>All subtitle words are listed on the buttons to the right in reverse order of use,
			the most used ones (those that appear in multiple lines) are listed first, so you can see which practice first.
			<br><br>Clicking on a button calls up all lines containing the word.
		</Hm816>	
		<Hm817>Each line containing the requested word is represented by a button.
			Clicking on one of these plays the corresponding piece.
			<br><br>The right button <b>Play + line</b> is used to play one line after another.
			<br>The <b>Repeat line</b> button is used to repeat the line.
			<br>The <b>Repeat endlessly line</b> button is used to repeat the line endlessly (click again to stop).
			<br><br>It is possible to decrease the playback speed by acting on the slider <b>Change speed</b>.
			<br><br>The two cursors <b>change the start time</b> and <b>change the end time</b> can be useful
			to make the start and end of the line earlier or later if needed.
		</Hm817>
	</lang_en>	
	<lang_it>
		<id_language>it</id_language>	
		<languageName>Italiano</languageName>	
		
		<Afile>cbc_builder.html</Afile>	
		<Ama20>manca il titolo</Ama20>
		<Ama21>il file dei sottotitoli originali non è stato ancora letto oppure è vuoto</Ama21>		
		<Ama22>manca il testo in lingua originale</Ama22>		
		<Ama23>manca il testo tradotto</Ama23>		
		<Ama24>il file di testo non può essere utilizzato, serve un file di sottotitoli</Ama24>	
		<Ama25>il contenuto del file <b>§file§</b> non è in  formato di sottotitoli srt</Ama25>
		<Ama26>ma se va bene così nella finestra <b>§m705§</b> scrivi 3 puntini di seguito <b>§...§</b></Ama26>   
		<Ama30>secondi senza dialogo</Ama30>
		<Amh00>../DOC/doc_Italiano/doc_it.html</Amh00>	
		<Am001>dopo che hai premuto il tasto qui sotto,
					<br>prima di cliccare sul nome del file scelto, 
				<br>seleziona e copia l&apos;indirizzo completo della cartella che lo contiene  (dovrai incollarlo subito dopo) 
		</Am001>		
		<Am002>Scegli il file video o audio</Am002>
		<Am003>Conferma o fai una nuova scelta</Am003>
        <Am004>Conferma</Am004>	
		<Am005>Nome del File</Am005>			
		<Am006>Torna indietro</Am006>
		<Am007>Esiste il file di sottotitoli in lingua originale?</Am007>
		<Am008>Si, esiste</Am008>			
		<Am009>No, non esiste</Am009>		
		<Am010>L&apos;input consiste in un file video o audio, un file di testo o di sottotitoli in lingua originale e tradotti
			<br>uno o più file possono mancare 
		</Am010>
		<Am011>Esiste un file video o audio da riprodurre?  </Am011>
		<Am012>Si, esiste un file video o audio  </Am012>
		<Am013>No, non c\'&egrave; n&eacute; un file video n&eacute; un file audio</Am013>
		<Am014>ma esiste un file di testo</Am014>
		<Am015>il tipo file del testo originale <b>§origtype§</b> 
			non &egrave; eguale a quello del testo tradotto <b>§trantype§</b>
		</Am015>
		<Am138> Download</Am138>
		<Am139> Nella cartella dei download saranno scaricati due file.
					<br> Premi il pulsante qui sotto per scaricare il primo file (contiene tutti i sottotitoli)
					</Am139>
		<Am140> Scarica il file di script</Am140>
		<Am141> Scarica il file html</Am141>
		<Am142> Dopo che il precedente download è stato completato, premi il pulsante qui sotto per scaricare il secondo file.
					<br><br>Dopo che i due file sono stati scaricati, esci da questa pagina. 				
					<br><br>I file appena creati (...html e ...jstxt) sono pronti da eseguire (click su file ...html)
					<br>I due file possono essere spostati in qualsiasi altra cartella, ma devono stare sempre insieme.<br><br>
					</Am142>
		<Am143> Scarica il file html</Am143>	

		<Am157> incolla qui sotto il percorso al file selezionato</Am157>
		<Am158> Conferma</Am158>
		<Am159> Conferma</Am159>		
		<Am161> Scrivi il titolo</Am161>	
		<Am700> Uno strumento per <br>migliorare la comprensione delle lingue straniere</Am700>
		<Am704> Sottotitoli Originali</Am704>
		<Am705> Sottotitoli Tradotti</Am705>
		<Am706> Ottiene sottotitoli e scrive nuovo file</Am706>
		<Am714> testo in lingua originale</Am714>
		<Am715> testo tradotto</Am715>
		<Am875> Cartella File Video/Audio</Am875>	
		<Amb64>non è un testo</Amb64>
		<Amb65>non è un file di testo</Amb65>						
		<Amb67> Specifica i file sottotitoli da utilizzare e quindi <br>clicca qui sotto<br>per scaricare i due file</Amb67>		
		<Amb68> Specifica i file sottotitoli da utilizzare e quindi <br>clicca qui sotto<br>per scaricare i due file</Amb68>		
		
		<Cfile>cbc_Player_Words_ClipByClip.html</Cfile>
		<Cm001>ERRORE</Cm001>
		<Cm002>Questo file html non ha parametri da usare.</Cm002>
		<Cm003>Sembra che sia stato avviato facendo clic su di esso o scrivendo il suo nome sul comando di riga,
			<br>ma non può andare da solo (gli mancano i dati da usare).
		</Cm003>
		<Cm004>Deve essere chiamato da un file creato da <b>ClickByClip_builder.html</b>.</Cm004>
		<Cm500>Parole</Cm500>	  
		<Cm501>DOC/shared/cbc_4_HELP.html?language=it</Cm501>
		<Cm502>$numwords$ parole ($percSingle$%) formano il <b>$percX$% del testo</b></Cm502>	  
		<Cm503>Questa parola si trova in $numrighe$ righe (Clicca sul pulsante in giallo per eseguire la prima riga)</Cm503>		
		<Cm504>Tutte le parole dei sottotitoli sono elencate come pulsanti qui a destra in ordine inverso di frequenza, dal più al meno referenziato.</Cm504>
		<Cm505>Cliccando su un pulsante che riporta una parola è possibile riprodurre tutte le righe di sottotitoli che la contengono</Cm505>
		<Cm507>modifica tempo di inizio</Cm507>
		<Cm508>modifica tempo di fine</Cm508>
		<Cm509>La parola si trova nelle righe identificate dai numeri listati sotto di essa<br>
			(puoi riprodurre una riga dopo l&apos;altra facendo clic sul pulsante <b>play +</b>, <br>
			oppure puoi fare clic su uno qualsiasi dei numeri elencati e quindi sul pulsante <b>ripeti</b>)			
		</Cm509>
		<Cm510>Play + <br>riga </Cm510>
		<Cm511>Ripeti<br>riga</Cm511> 
		<Cm512>Mostra Sottotitoli Originali</Cm512>
		<Cm513>Mostra Sottotitoli Tradotti</Cm513>	
		<Cm514>Ripeti infinit.<br>riga</Cm514>	
		<Cm515>righe</Cm515>
		<Cm516>riga</Cm516>
		<Cm604>Tutte le parole del testo sono elencate come pulsanti qui a destra in ordine inverso di frequenza, dal più al meno referenziato.</Cm604>
		<Cm605>Cliccando su un pulsante che riporta una parola è possibile leggere tutte le righe che la contengono</Cm605>		
		<Cm609>La parola si trova nelle righe identificate dai numeri listati sotto di essa<br>
			per leggere una riga cliccare sul numero corrispondente oppure <br>
			per passare da una alla successiva cliccare sul pulsante <b>Vai alla riga</b>
		</Cm609>		
		<Cm610>Vai alla <br>riga</Cm610>
		<Cm611>Mostra<br>linea</Cm611>
		<Cm612>Mostra riga di testo originale</Cm612>
		<Cm613>Mostra riga di testo tradotta</Cm613>	
		<Cmt01>Sintesi vocale</Cmt01>
		<Cmt02>Seleziona la voce</Cmt02>
		<Cmt03>Volume</Cmt03>
		<Cmt04>Velocità</Cmt04>
		<Cmt05>Tono</Cmt05>
		<Dmh00>../DOC/doc_Italiano/doc_it.html</Dmh00>	
		<Dfile>ras_PLAYER.html</Dfile>
		<Dm001>ERRORE</Dm001>
		<Dm002>Questo file html non ha parametri da usare.</Dm002>
		<Dm003>Sembra che sia stato avviato facendo clic su di esso o scrivendo il suo nome sul comando di riga,
			<br>ma non può andare da solo (gli mancano i dati da usare).
		</Dm003>
		<Dm004>Deve essere chiamato da un file creato da <b>ClickByClip_builder.html</b>.</Dm004>
		<Dm010>quanto stai lavorando con questo file</Dm010>
		<Dm011>Sessione<br>&nbsp;</Dm011>
		<Dm012>num.<br>giorni</Dm012>
		<Dm013>num.<br>sessioni</Dm013>
		<Dm014>num.<br>clips</Dm014>
		<Dm015>tempo<br>utilizzo</Dm015>		
		<Dm017>questa sessione</Dm017>
		<Dm018>tutte le sessioni</Dm018>
		<Dm019>num.<br>righe sott.</Dm019>
		<Dm020>num.<br>parole</Dm020>
		<Dm021>il dialogo termina con</Dm021>
		<Dm022>secondi e completamento della frase</Dm022>
		<Dm023>secondi e fino alla fine di eventuali sovrapposioni di voci</Dm023>
		<Dm024>Play tutta la clip</Dm024>
		<Dm026>Traduzione della riga in riproduzione</Dm026>
		
		<Dm033>Nascondi i sottotitoli della clip</Dm033>
		<Dm034>Play tutta la clip</Dm034>
		<Dm035>Mostra tutti i sottotitoli</Dm035>
		<Dm036>Nascondi tutti i sottotitoli</Dm036>
		<Dm037>mostra</Dm037>
		<Dm038>nascondi</Dm038>
		<Dm039>traduzione dell&apos;ultima riga</Dm039>
		<Dm040>Cambia la velocit&agrave;</Dm040>
		<Dm100>Specifica tipo e durata delle clip</Dm100>
		<Dm101>Modifica la durata delle clip</Dm101>
		<Dm103>secondi</Dm103>
		<Dm104>secondi e completamento dialogo</Dm104>
		<Dm105>secondi e completamento della riga</Dm105>
		<Dm106>righe di sottotitoli</Dm106>
		<Dm107>Play</Dm107>
		<Dm108>una nuova Clip</Dm108>
		<Dm109>Cambia<br>tipo e durata</Dm109>
		<Dm110>Sincronizzazione</Dm110>
		<Dm111>Sottotitoli</Dm111>
		<Dm112>Cambia<br>durata</Dm112>
		<Dm113>Reset</Dm113>
		<Dm114>Pausa<br>Continua</Dm114>
		<Dm115>mostra tutti i sottotitoli</Dm115>
		<Dm116>nascondi tutti i sottotitoli</Dm116>
		<Dm218>Significato dei pulsanti</Dm218>
		<Dm119>premi per stabilire l&apos;inizio delle selezione delle righe</Dm119>
		<Dm120>premi per stabilire la fine della selezione delle righe</Dm120>
		<Dm121>premi per riprodurre</Dm121>
		<Dm122>premi per riprodurre e poi ripetere all&apos;infinito</Dm122>
		<Dm126>Durata di una Clip</Dm126>
		<Dm501>DOC/shared/cbc_4_HELP.html?language=it</Dm501>
		<Dm145>reset</Dm145>
		<Dm146>ripristina i colori iniziali di testo e sfondo</Dm146>
		<Dm147>scegli il colore dello sfondo</Dm147>
		<Dm148>scegli il colore del testo</Dm148>
		<Dm149>ricerca automatica del colore di testo più adatto allo sfondo</Dm149>
		<Dm167>la riga è visibile, premi per nasconderla</Dm167>
		<Dm168>la riga è invisibile, premi per renderla visibile  </Dm168>
		<Dm169>la traduzione è nascosta, premi per renderla visibile</Dm169>
		<Dm170>la traduzione è visibile, premi per nasconderla  </Dm170>
		<Dm171>correzione del tempo di inizio o fine della riga</Dm171>
		<Dm201>Colori</Dm201>
		<Dm202>Cambia i Colori</Dm202>
		<Dm204>Sfondo</Dm204>
		<Dm205>Testo</Dm205>
		<Dm206>Testo</Dm206>
		<Dm207>autom.</Dm207>
		<Dm208><br>Il <b>Contrasto</b>tra i colori dello sfondo e del testo è</Dm208>
		<Dm209>buono</Dm209>
		<Dm210>insufficiente</Dm210>
		<Dm211>cambia il colore dello sfondo o del testo<br>oppure premi il tasto <b>autom.</b>
		<br>per cercare automaticamente il colore di testo più adatto
		</Dm211>
		<Dm212>sto cercando il colore migliore</Dm212>
		<Dm213>Statistiche</Dm213>		
		<Dm220>selez. inizio</Dm220>  
		<Dm221>selez. fine</Dm221>   
		<Dm222>mostra / nascondi<br>sottotitoli</Dm222> 
		<Dm223>mostra / nascondi<br>traduzione</Dm223> 
		<Dm224>Sottotitoli</Dm224>
		<Dm225>Play una sola volta</Dm225> 
		<Dm226>Play all&apos;infinito</Dm226>
		<Dm227>N.</Dm227>
		<Dm228>da</Dm228>
		<Dm229>a</Dm229>
		<Dm230>massimo numero di <br>secondi di spostamento<br></Dm230>
		<Dm231>far scorrere il cursore a sinistra o a destra<br>per anticipare <br>o posticipare<br>l&apos;inizio della riga</Dm231>
		<Dm232>far scorrere il cursore a sinistra o a destra<br>per anticipare <br>o posticipare <br>la fine della riga</Dm232>		
		<Dm244><b>Per sincronizzare i sottotitoli col parlato</b>
		</Dm244>
		<Dm245><ul><li>Seleziona un gruppo di righe di sottotitoli (tasti <b>&#8594; &nbsp; &#8592;</b>), 
		</li><li>assicurati che i sottotitoli siano visibili (libro aperto &#128214;)  
		</li><li>clicca sull&apos;icona della testa parlante &#128483; per far partire la riproduzione.  	
		</li><li>appena una qualsiasi riga di sottotitoli è stata completamente pronunciata premi il tasto <b>Stop</b>
		</li><li>Se è difficile riuscire a fermare la riproduzione al punto esatto, diminuisci la velocità (cursore verticale a destra) e riprova.
		</li><li>Dopo lo stop si aprirà un riquadro dove dovrai indicare questa riga. 
		</li><li>A questo punto la correzione sarà stata effettuata e 
			resterà attiva anche nelle sessioni successive (anche dopo aver fatto ripartire il computer).
		</li><li>Per chiudere questa finestra premi il tasto <b>Sync.OK</b>. </li></ul>
		</Dm245>
		<Dm300>Parole</Dm300>
		<Dm302>Bilingue Stampabile</Dm302>		
		<Dm303>Testo Stampabile</Dm303>	
		<Dm324>Testo</Dm324> 
				<Dm400><b>Per sincronizzare i sottotitoli con il parlato</b></Dm400>
		<Dm401><ul><li>Seleziona un gruppo di righe di sottotitoli </li></ul></Dm401>
		<Dm402>Esercitati<br>ascoltando e leggendo<br>solo poche righe di sottotitoli alla volta</Dm402>
		<Dm403>Esercitati<br>ascoltando<br>solo pochi secondi alla volta</Dm403>
		<Dm404>Esercitati<br>con l'ascolto (voce sintetica) e la lettura </Dm404>
		<Dm405>Tasso</Dm405>
		<Dm406>ora di fine</Dm406>
		<Dm407>secondi</Dm407>
		<Dm408>dal <br>secondo</Dm408>
		<Dm409>al <br>secondo</Dm409>
		<Dm410>testo</Dm410>
		<Dm411>Sottotitoli</Dm411>
		<Dm412>Premere il pulsante della riga che termina con l'ultima parola pronunciata</Dm412>
		<Dm413>linee di sottotitoli</Dm413>
		<Dm414>riga dei sottotitoli</Dm414>
		<Dm415>mostra tutti i sottotitoli</Dm415>
		<Dm416>nascondi tutti i sottotitoli</Dm416>
		<Dm417>aumentato di</Dm417>
		<Dm418>diminuito di</Dm418>
		<Dm419>Testo bilingue</Dm419>
		<Dm420>parlato in</Dm420>	
		<Dm421>testo</Dm421>	
		<Dm422>Play la voce scelta</Dm422>                          
        <Dm423>Play una voce a turno</Dm423>    
		<Dm424>Play pausa tra le parole</Dm424>
        <Dm425>N.</Dm425>	
		<Dm426>Tono</Dm426>
		<Dm427>Velocità</Dm427>
		<Dm428>Pausa</Dm428>
		<Dm429>Riprendi</Dm429>
		<Dm430>Annulla</Dm430>
		<Dm431>Indietro</Dm431>  
		<Dm432>manca il testo in lingua originale</Dm432>	
		<Dm433>manca la traduzione</Dm433>	
		<Dm434>ma se va bene così, scrivi al suo posto 3 puntini di seguito <b>§...§</b></Dm434>  	
		<Dm435>Seleziona la prima voce che dovrà leggere il testo</Dm435>
		<Dm436>le altre voci nella stessa lingua leggeranno a turno</Dm436>
		<Dm437>continua</Dm437>
		<Dm438>testo §1§</Dm438>
		<Dm439>specifica la lunghezza massima delle righe</Dm439>  
		<Dm440>continua</Dm440>	
		<Dm441>comprensione orale</Dm441>	
		<Dm451>Seleziona una voce</Dm451>
		<Dm452>lingua</Dm452>
		<Dm453>voce</Dm453>
		<Dm454>continua</Dm454>
		<Dm455>seleziona inizio</Dm455>
		<Dm456>seleziona fine</Dm456>
		<Dm457>mostra / nascondi<br>testo</Dm457>
		<Dm458>mostra / nascondi<br>traduzione</Dm458>		
		<Dm463>parola<br>per<br>parola</Dm463>
		<Dm464>Uno strumento per migliorare la<br>§oralcomprehension§<br> delle lingue straniere</Dm464>
		<Dm465>ascoltando un testo <br>letto una riga per volta, una parola per volta
			<br><br>ad ogni click la riga o la parola viene letta dalla voce indicata 
			<br>anche a velocità ridotta se richiesto   
		</Dm465>
		<Dm466>Incolla qui sotto il testo in <b>§1§</b></Dm466>
		<Dm467>Incolla la traduzione riga per riga qui sotto </Dm467>
		<Dm468>(se non esiste scrivere 3 punti...)</Dm468>	
		<Dm470>sottotitolo n.§r1§</Dm470>
		<Dm471>parola n.§w1§</Dm471>
		<Dm472>voce reale</Dm472>
		<Dm473>voci sintetiche</Dm473> 
		
		<Dm711>Righe</Dm711>			
		<Dm715>mostra tutte le righe</Dm715>m119
		<Dm716>nascondi tutte le righe</Dm716>
		<Dm717>lista tutte le righe</Dm717>	
		<Dm731>vai a inizio delle righe in lingua originale</Dm731>  
		<Dm732>vai a inizio delle righe tradotte</Dm732>	
		<Dm782>Mostra i  <b>Sottotitoli</b>della riga in riproduzione</Dm782>
		<Dm783>Mostra la <b>Traduzione</b>della riga in riproduzione</Dm783>
		<Dm791>Testo in lingua originale</Dm791>
		<Dm792>Testo tradotto</Dm792>
		<Dm846>Salta</Dm846>		
		<Dm893>La riga tradotta dovrebbe servire <br>solo per avere un'idea del significato.<br>
			<b>La traduzione riga per riga è generalmente inaffidabile.</b>
		</Dm893>
		<Dm894>Clic sul pulsante <b>t?</b> per leggere i sottotitoli</Dm894>			
		<Dm895>Esercitati<br>ascoltando e leggendo<br>solo poche righe di sottotitoli alla volta</Dm895>
		<Dm896>Esercitati<br>ascoltando<br>solo pochi secondi alla volta</Dm896>
		<Dm897>Esercitati<br><small>ascoltando (voce sintetica) e leggendo </small><br>solo poche righe di testo alla volta</Dm897>	
		<Dm900>Aspetta un momento, per piacere <br></Dm900> 
		<Dma06>Conferma</Dma06>
		<Dma10>Premi per scaricare</Dma10>
		<Dma12>titolo</Dma12>
		<Dma17><b>Questa è l&apos;area dei sottotitoli</b>,<br>è possibile spostarla trascinando l&apos;ancora 
		<br>(cliccare sull&apos;ancora e tenendo schiacciato spostare il mouse)
		<br>E&apos; possibile modificare le dimensione di questa striscia<br>trascinando il quadrato blu .
		</Dma17>
		<Dma18>Devi spostare il file scaricato dalla cartella dei download alla cartella <b>ClipByClip/PLAYER</b></Dma18>
		<Dma20>manca il titolo</Dma20>
		<Dma21>il file dei sottotitoli originali non è stato ancora letto oppure è vuoto</Dma21>
		<Dma24>errore1 nel passaggio precedente: riga in formato senza aspetti in extract_time(</Dma24>
		<Dma25>errore2 nel passaggio precedente: riga in formato senza aspetti in extract_time(</Dma25>
		<Dma26>errore3 in extract_time()</Dma26>
		<Dma30>secondi senza dialogo</Dma30>
		<Dma50>Seleziona uno o più file.</Dma50>
		<Dma52>non può essere riprodotto</Dma52>
		<Dma80>Mostra</Dma80>
		<Dma81>Nascondi</Dma81>
		<Dmb07>oppure</Dmb07>
		<Dmb10>I file video o audio da riprodurre devono trovarsi nella cartella <b>ClipByClip/VideoAudio</b></Dmb10>
		<Dmb12>VIDEO o File audio</Dmb12>
		<Dmb13>Seleziona un&apos;altro file Video o Audio nella cartella <b>ClipByClip/VideoAudio</b></Dmb13>
		<Dmb22>per migliorare la comprensione di ascolto e lettura di una lingua straniera</Dmb22>
		<Dmb23>per migliorare la comprensione di ascolto e lettura di una lingua straniera</Dmb23>
		<Dmb50>Errore<br>il file non è un video e neppure un audio</Dmb50>
		<Dmb62>il file da eseguire</Dmb62>
		<Dmb64>non è un testo</Dmb64>
		<Dmb65>non è un file di testo</Dmb65>
		<Dmb67>Specifica i file sottotitoli da utilizzare e quindi <br>clicca qui sotto<br>per scaricare i due file</Dmb67>
		<Dmb68>Specifica i file sottotitoli da utilizzare e quindi <br>clicca qui sotto<br>per scaricare i due file</Dmb68>
		<Dmb71>codificati nel file video</Dmb71>
		<Dmb74><b>Nome e percorso della cartella devono essere gli stessi di quelli che contengono il file </b></Dmb74>
		<Dmb77>è stato scaricato nella cartella download</Dmb77>
		<Dmb78>Per poterlo eseguire cambia la parte finale del nome in <b>.html</b></Dmb78>
		<Dmb79>Questo file può essere spostato ed eseguito in qualunque cartella del computer</Dmb79>
		<Dmb81>il file</Dmb81>
		<Dmb83>tempo di fine</Dmb83>
		<Dmb84>secondi</Dmb84>
		<Dmb85>dal <br>secondo</Dmb85>
		<Dmb86>al <br>secondo</Dmb86>
		<Dmb89>testo</Dmb89>
		<Dmb90>Premi il pulsante della riga che termina con l&apos;ultima parola pronunciata</Dmb90>
		<Dmb91>righe di sottotitolo</Dmb91>
		<Dmc85>riga sottotitolo</Dmc85>
		<Dmc86>aumentato di</Dmc86>
		<Dmc87>diminuito di</Dmc87>			
		<Dmc88>Testo Bilingue</Dmc88>   
		<Dmt01>Sintesi vocale</Dmt01>
		<Dmt02>Seleziona la voce</Dmt02>
		<Dmt03>Volume</Dmt03>
		<Dmt04>Velocità</Dmt04>
		<Dmt05>Tono</Dmt05>			
		<Dm100>Testo Bilingue ottenuto dai sottotitoli</Dm100>
		
		<Hfile>doc/helpxx.html</Hfile>
		<Hm800><b>ClipByClip</b> è uno strumento per esercitarsi nella comprensione di una lingua.</Hm800>
		<Hm820>Può essere utilizzato in modalità attiva ascoltando, leggendo e ripetendo
			<br>o in modalità passiva ascoltando all&apos;infinito alcune righe di sottotitoli mentre si &egrave; impegnati a fare altro.
			<br>Può anche essere utile nella lingua madre per memorizzare ad esempio una poesia, un brano in prosa o un elenco di termini.
		</Hm820>
		<Hm812>Quello che segue potrebbe essere un possibile utilizzo dell&apos;applicazione</Hm812>
		<Hm801>Seleziona alcune righe di sottotitoli da riprodurre cliccando 
			sull&apos;icona §arrowRight§ della prima riga e §arrowLeft§ dell&apos;ultima riga.</Hm801>
		<Hm802>Nascondi queste righe (clicca per cambiare l&apos;icona §openedbook§ in §closedBook§) e
			riprodurli una (cliccare sull&apos;icona §talkingHead§) o più volte (icona §infinity§).
		</Hm802>
		<Hm803>Se ti è utile puoi ridurre la velocità di riproduzione (cursore verticale).</Hm803>
		<Hm804>Prova a ripetere quello che senti</Hm804>
		<Hm805>Mostra le righe (fai clic per cambiare l&apos;icona §openedbook§ in §closedBook§) e riproducile di nuovo.</Hm805>
		<Hm806>Per vedere la traduzione fai clic sull&apos;icona §hideTran§ per cambiarla in §showTran§.</Hm806>
		<Hm807>Puoi riprodurre e fare pratica con una riga di sottotitoli alla volta</Hm807>
		<Hm808>Naturalmente puoi goderti il video come al solito dall&apos;inizio alla fine con o senza sottotitoli.</Hm808>
		<Hm809>Per guardare il film senza interruzioni cliccare 
			sul pulsante con la freccetta che si trova appena sotto il video. </Hm809>
		<Hm810>Per leggere i sottotitoli in lingua originale cliccare sull&apos;icona §closedBook§, 
			<br>e  per nasconderli cliccare su §openedbook§.</Hm810>
		<Hm811>Per leggere i sottotitoli tradotti cliccare sull&apos;icona §hideTran§ e per nasconderli cliccare sull&apos;icona §showTran§. </Hm811>
		<Hm813>Per selezionare alcune righe di sottotitoli da riprodurre cliccare sull&apos;icona §arrowRight§ della prima riga
			e la §arrowLeft§ dell&apos;ultima riga.<br>Prima della prima riga e dopo l&apos;ultima appariranno due strisce evidenziate.
			<br>I pulsanti sulla nuova riga prima della prima hanno effetto su tutte le righe selezionate
			(es. cliccando sulla §talkingHead§ vengono riprodotte tutte le righe selezionate). 
		</Hm813>
		<Hm814>È possibile sapere quando un sottotitolo è in riproduzione anche quando è invisibile,
			perché in questo caso la riga che lo contiene è incorniciata da un bordo rosso.
		</Hm814>
		<Hm815>Puoi mostrare, nascondere e riprodurre una singola riga all&apos;interno di un gruppo selezionato</Hm815>
		<Hm816>Questa pagina è richiamata dal pulsante <b>Parole in ordine inverso di utilizzo</b>.
			<br>Tutte le parole dei sottotitoli sono listate sui pulsanti a destra in ordine inverso di utilizzo,  
			le più usate (quelle che compaiono in più righe) sono elencate per prime, in tal modo è possibile notare con quali conviene esercitarsi per prima.
			<br><br>Cliccando su un pulsante si richiamano tutte le righe che contengono la parola.		
			</Hm816> 
		<Hm817>Ogni riga che contiene la parola richiesta è rappresentata da un pulsante. 
			Cliccando su uno di questi si riproduce il brano corrispondente. 
			<br><br>Il pulsante a destra <b>Play + riga</b> serve a riprodurre una riga dopo l&apos;altra. 
			<br>Il pulsante <b>Ripeti riga</b> serve a ripetere la riga. 
			<br>Il pulsante <b>Ripeti infinito riga</b> serve a ripetere all&apos;infinito la riga (per bloccare cliccare di nuovo). 
			<br><br>E&apos; possibile diminuire la velocità di riproduzione agendo sul cursore <b>Cambia la velocità</b>. 
			<br><br>I due cursore <b>cambia il tempo di inizio</b> e <b>cambia il tempo di fine</b> possono essere utili 
				per anticipare o posticipare l&apos;inizio e la fine della riga se necessario. 
		</Hm817>	
	</lang_it>
</messages>	
`; // end of xml_text ( ` alt + 96 )

return xml_text;

} // end of get_messages()
//=======================================================================