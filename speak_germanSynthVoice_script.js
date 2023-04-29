let selected_langRegion = "de-DE";
let selected_voice_name = "Microsoft Stefan - German (Germany)";
let voice_toUpdate_speech;
let speech_volume = 1;
let speech_rate = 1;
let speech_pitch = 1;
let utteranceList = [];
let sw_pause = false;
let startTime ;
let txt_length ;
let x1_line = 0;
function hide_synthVoices() {}

let listVox = [
    [0, 0]
]; // selected voices only   
let synth = window.speechSynthesis;
//-------------------------------

var myVoice;
let voices;
//----------------------

var swFirst = true;

//-------------------
function firstPlay() {
    fcommon_load_all_voices(); // at end calls tts_1_toBeRunAfterGotVoices()

    // WARNING: the above function contains asynchronous code.  
    // 			Any statement after this line is executed immediately without waiting its end
}


//-------------------------------------------------
function tts_1_toBeRunAfterGotVoices() {

    if (voices.length < 1) return;

    voices.sort(
        function(a, b) {
            return ((a.lang + a.name) > (b.lang + b.name)) ? 1 : -1;
        }
    );
    var pLang2 = "??";
    var pLang4;
    var numL2 = 0;
    var numL4 = 0;
    var langName;
    var ixSele = -1;
    var sele_str = "";
    var selected_yes = "selected";
    var swSele = false;
    /***
      for (var z1 = 0; z1 < voices.length; z1++) {
		  swSele = false; 
          var lang = voices[z1].lang;
          var lang2 = lang.substr(0, 2);
          if (lang != pLang4) {
              //console.log(lang);
              numL4++;
              if (lang2 != pLang2) {
				  langName = get_languageName(lang).split("-")[0].trim(); 
                  numL2++;
                  sele_str += '   </optgroup> \n';
                  sele_str += '   <optgroup label="' + lang2 + ' ' + langName + '"> \n';
              }
          }
		  
		  if (lang == "en-GB") {
			if (ixSele < 0) {
				ixSele=z1;
			}	
		  }
		  if (ixSele == z1) {
				sele_str += '      <option value="' + z1 + '" selected>' + lang + " " + voices[z1].name +  '</option> \n';
		  } else {
			  sele_str += '      <option value="' + z1 + '">' + lang + " " + voices[z1].name +  '</option> \n';
		  }		
		 
          pLang4 = lang;
          pLang2 = lang2;
      }	  
	  pLang4 = lang;
      sele_str += '   </optgroup> \n';
	  
      let voiceSelect = document.getElementById("id_voices");
      voiceSelect.innerHTML = sele_str;
		*****/

    my_tts_2_fill_the_voices();
    var ix = selected_voice_ix;
    var langRegion = "de-DE";
    var langname = langRegion.split("-")[0];

    myVoice = voices[ix].lang + " " + voices[ix].name;
    selected_voiceLangRegion = voices[ix].lang;
    selected_voiceLang2 = selected_voiceLangRegion.substr(0, 2);
    selected_voiceName = voices[ix].name;

    //tts_3_show_speakingVoiceFromVoiceLangName(selected_voiceLangRegion, selected_voiceName);
} // end of ...	
//-----------------------------
//-------------------------------------------------

function my_onclick_tts_text_to_speech2(txt1, numVox) {

    sw_pause = false;
    startTime = new Date();
    txt_length = txt1.length;

    utteranceList = [];
    x1_line = 0;


    var objtxt_to_speak = new SpeechSynthesisUtterance(txt1);

    objtxt_to_speak.voice = listVox[numVox][1];
    //tts_3_set_speech_Parms(objtxt_to_speak);    

    synth.speak(objtxt_to_speak);

} // end of onclick_tts_text_to_speech2() 	
//----------------------------------

function my_tts_2_fill_the_voices() {

    var numTotVoices = voices.length;

    console.log("selected_voice_name=" + selected_voice_name);
    console.log("selected_langRegion=" + selected_langRegion);


    console.log(numTotVoices + " voices loaded");

    selected_voice_ix = -1;


    var swNotFound = true;
    for (var ix = 0; ix < numTotVoices; ix++) {
        if (selected_voice_name == voices[ix].name) {
            swNotFound = false;
            selected_voice_ix = ix;
            console.log("voice found in getVoices() --> index: selected_voice_ix=" + selected_voice_ix);
            break;
        }
    }
    var vox;
    listVox = [];
    totNumMyLangVoices = 0;
    var ixLa4 = -1;
    var ixLa2 = -1;
	var v2;
    if (swNotFound) {
        console.log("voce name '" + selected_voice_name + "'  not found, maybe you have not used the same browser as in the Builder phase");
        console.log("\tnow it is looked for the same language-region or at least the same language");
        for (v2 = 0; v2 < voices.length; v2++) {
            vox = voices[v2];
            if (vox.lang == selected_langRegion) {
                console.log("\tfound the same language-region '" + selected_langRegion + "' voce name '" + vox.name + "'");
                ixLa4 = v2;
                break;
            }
            if (ixLa2 >= 0) continue;
            if (vox.lang.substr(0, 2) == selected_voiceLang2) ixLa2 = v2;
        }
        if (ixLa4 < 0) {
            console.log("\tthe same language-region has not been found,");
            ixLa4 = ixLa2;
            if (ixLa4 > 0) {
                vox = voices[ixLa4];
                console.log("\tbut the same language has been found '" + vox.lang + "' voce name '" + vox.name + "'");
            }
        }
        if (ixLa4 >= 0) selected_voice_ix = ixLa4;
    }
    if (selected_voice_ix < 0) {
        selected_voice_ix = 99999;
        console.log("the required voice language '" + selected_voiceLang2 +
            "' has not been found, no voice will be used");
        listVox = [];
        totNumMyLangVoices = 0;
        hide_synthVoices();
        return;
    }
    if (selected_voice_ix < numTotVoices) {
        vox = voices[selected_voice_ix];
        selected_voice_name = vox.name;
        selected_langRegion = vox.lang;
        selected_voiceLang2 = selected_langRegion.substr(0, 2);
        listVox.push([vox.lang, vox]);
    }
    //------------------------------------------
    // secondly the same language-region 
    for (v2 = 0; v2 < voices.length; v2++) {
        vox = voices[v2];
        if (v2 == selected_voice_ix) continue;

        if (selected_langRegion != vox.lang) continue;

        listVox.push([vox.lang, vox]);
    }
    //---------------------------------	
    // thirdly the same language
    for (v2 = 0; v2 < voices.length; v2++) {
        vox = voices[v2];
        if (selected_langRegion == vox.lang) continue;
        if (selected_voiceLang2 != vox.lang.substr(0, 2)) continue;
        listVox.push([vox.lang, vox]);
    }
    //---------------------------------	

    for (v3 = 0; v3 < listVox.length; v3++) {
        var vv1, vv2;
        [vv1, vv2] = listVox[v3];
        console.log("listVox[" + v3 + "] = " + vv1 + " " + vv2.name);
    }
    //----------------	
    var chosenIxVox = 0;
    //-----------
    totNumMyLangVoices = listVox.length;
    if (listVox.length == 0) {
        return;
    }
    console.log("listVox length=" + listVox.length);
    voice_toUpdate_speech = listVox[0][1];


    var voxLang;
    var pVox = "";
    var xbr;
    var vv3 = 0;
    var v3;
    var idhvox, idh2, eleH;
    totNumMyLangVoices = listVox.length;

} // en dof my_tts_2...
//----------------
function tts_2_fill_the_voices() {
    console.log("\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\nxx tts_2_fill_the_voices()\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    var numTotVoices = voices.length;

    console.log("selected_voice_name=" + selected_voice_name) + " (from url parameter)";
    console.log("selected_langRegion=" + selected_langRegion + " (from url parameter)");


    console.log(numTotVoices + " voices loaded");
    //console.log("voices[0]=" + voices[0].name); 
    //console.log("voices["+(numTotVoices-1)+"]=" + voices[(numTotVoices-1)].name); 

    selected_voice_ix = -1;


    var swNotFound = true;
    for (var ix = 0; ix < numTotVoices; ix++) {
        if (selected_voice_name == voices[ix].name) {
            swNotFound = false;
            selected_voice_ix = ix;
            console.log("voice found in getVoices() --> index: selected_voice_ix=" + selected_voice_ix);
            break;
        }
    }
    var vox;
    listVox = [];
    totNumMyLangVoices = 0;
    var ixLa4 = -1;
    var ixLa2 = -1;
	var v2; 
    if (swNotFound) {
        console.log("voce name '" + selected_voice_name + "'  not found, maybe you have not used the same browser as in the Builder phase");
        console.log("\tnow it is looked for the same language-region or at least the same language");
        for (v2 = 0; v2 < voices.length; v2++) {
            vox = voices[v2];
            if (vox.lang == selected_langRegion) {
                console.log("\tfound the same language-region '" + selected_langRegion + "' voce name '" + vox.name + "'");
                ixLa4 = v2;
                break;
            }
            if (ixLa2 >= 0) continue;
            if (vox.lang.substr(0, 2) == selected_voiceLang2) ixLa2 = v2;
        }
        if (ixLa4 < 0) {
            console.log("\tthe same language-region has not been found,");
            ixLa4 = ixLa2;
            if (ixLa4 > 0) {
                vox = voices[ixLa4];
                console.log("\tbut the same language has been found '" + vox.lang + "' voce name '" + vox.name + "'");
            }
        }
        if (ixLa4 >= 0) selected_voice_ix = ixLa4;
    }
    if (selected_voice_ix < 0) {
        selected_voice_ix = 99999;
        console.log("the required voice language '" + selected_voiceLang2 +
            "' has not been found, no voice will be used");
        listVox = [];
        totNumMyLangVoices = 0;
        hide_synthVoices();
        return;
    }
    if (selected_voice_ix < numTotVoices) {
        vox = voices[selected_voice_ix];
        selected_voice_name = vox.name;
        selected_langRegion = vox.lang;
        selected_voiceLang2 = selected_langRegion.substr(0, 2);
        listVox.push([vox.lang, vox]);
    }
    //------------------------------------------
    // secondly the same language-region 
    for (v2 = 0; v2 < voices.length; v2++) {
        vox = voices[v2];
        if (v2 == selected_voice_ix) continue;

        if (selected_langRegion != vox.lang) continue;

        listVox.push([vox.lang, vox]);
    }
    //---------------------------------	
    // thirdly the same language
    for (v2 = 0; v2 < voices.length; v2++) {
        vox = voices[v2];
        if (selected_langRegion == vox.lang) continue;
        if (selected_voiceLang2 != vox.lang.substr(0, 2)) continue;
        listVox.push([vox.lang, vox]);
    }
    //---------------------------------	

    for (v3 = 0; v3 < listVox.length; v3++) {
        var vv1, vv2;
        [vv1, vv2] = listVox[v3];
        console.log("listVox[" + v3 + "] = " + vv1 + " " + vv2.name);
    }
    //----------------	
    var chosenIxVox = 0;
    //-----------
    totNumMyLangVoices = listVox.length;
    if (listVox.length == 0) {
        return;
    }
    console.log("listVox length=" + listVox.length);
    voice_toUpdate_speech = listVox[0][1];


    var voxLang;
    var pVox = "";
    var xbr;
    var vv3 = 0;
    var v3;
    var idhvox, idh2, eleH;
    totNumMyLangVoices = listVox.length;

} // end of fill_the_voices()


//-------------------------------------------



